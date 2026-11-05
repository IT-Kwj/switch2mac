#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_45 [[user(locn8)]];
    float4 m_49 [[user(locn9)]];
    float4 m_60 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _67;
    float _95 = _93 * _73;
    float _97 = _93 * _79;
    float _99 = _93 * _85;
    float _101 = _93 * _91;
    float2 _700 = float2(_95, _97);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_700, float2(0.0), isnan(_700))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_700, float2(0.0), isnan(_700))).w;
    float2 _711 = float2(_99, _101);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_711, float2(0.0), isnan(_711))).w;
    float _107 = in.m_41.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_43.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = (*spvDescriptorSet0.fp_c10)._m0[13].z * (*spvDescriptorSet0.fp_c10)._m0[13].z;
    float _121 = fma(_119, 0.800000011920928955078125, -0.300000011920928955078125);
    float _123 = fma((*spvDescriptorSet0.fp_c10)._m0[13].y, -0.499999940395355224609375, 1.2999999523162841796875);
    float _125 = _93 * _117;
    float _127 = _103 + _121;
    float _129 = _93 * _111;
    float _131 = _129 + _105;
    bool _135 = _127 >= 0.5;
    bool _137 = isnan(_127);
    bool _139 = _135 || _137;
    bool _141 = isnan(0.5);
    bool _143 = _139 || _141;
    bool _145 = _131 >= _123;
    bool _147 = isnan(_131);
    bool _149 = _145 || _147;
    bool _151 = isnan(_123);
    bool _153 = _149 || _151;
    bool _155 = _153 && _143;
    float _157 = float(_155);
    float _159 = 0.0 + _157;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = _161 * _125;
    bool _165 = _163 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _167 = isnan(_163);
    bool _169 = _165 || _167;
    bool _171 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _173 = _169 || _171;
    float _175 = in.m_39.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_39.w;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    if (!_173)
    {
        discard_fragment();
    }
    float _187 = _93 * _179;
    float _189 = _93 * _185;
    float2 _840 = float2(_187, _189);
    float2 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_840, float2(0.0), isnan(_840))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_840, float2(0.0), isnan(_840))).xy;
    float _195 = _193.x;
    float _197 = _193.y;
    float _199 = in.m_45.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_45.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_45.z;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_47.y;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_47.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_47.z;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = in.m_49.y;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_49.x;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_51.y;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_51.x;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_51.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_49.z;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = _93 * _203;
    float _273 = _93 * _209;
    float _275 = _93 * _221;
    float _277 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _279 = _271 + _277;
    float _281 = _93 * _215;
    float _283 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _285 = _273 + _283;
    float _287 = _93 * _227;
    float _289 = _279 * _279;
    float _291 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _293 = _281 + _291;
    float _295 = _275 * _275;
    float _297 = _93 * _263;
    float _299 = fma(_285, _285, _289);
    float _301 = fma(_287, _287, _295);
    float _303 = fma(_293, _293, _299);
    float _305 = _93 * _233;
    float _307 = rsqrt(_303);
    float _309 = fma(_305, _305, _301);
    float _311 = _93 * _251;
    float _313 = rsqrt(_309);
    float _315 = _279 * _307;
    float _317 = _315 * 0.5;
    float _319 = _285 * _307;
    float _321 = _293 * _307;
    float _323 = _93 * _239;
    float _325 = _317 * _317;
    float _327 = _323 * _323;
    float _329 = fma(_319, _319, _325);
    float _331 = _93 * _245;
    float _333 = _275 * _313;
    float _335 = _287 * _313;
    float _337 = fma(_321, _321, _329);
    float _339 = fma(_331, _331, _327);
    float _341 = _93 * _257;
    float _343 = _311 * _311;
    float _345 = _305 * _313;
    float _347 = _93 * _269;
    float _349 = rsqrt(_337);
    float _351 = fma(_341, _341, _343);
    float _353 = _333 * _333;
    float _355 = fma(_347, _347, _339);
    float _357 = fma(_297, _297, _351);
    float _359 = fma(_335, _335, _353);
    float _361 = rsqrt(_355);
    float _363 = fma(_345, _345, _359);
    float _365 = _317 * _349;
    float _367 = _319 * _349;
    float _369 = _321 * _349;
    float _371 = rsqrt(_357);
    float _373 = _365 * _365;
    float _375 = fma(_367, _367, _373);
    float _377 = rsqrt(_363);
    float _379 = fma(_369, _369, _375);
    float _381 = rsqrt(_379);
    float _383 = _297 * _371;
    float _385 = _367 * _381;
    float _387 = _369 * _381;
    float _389 = in.m_53.y;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_55.x;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = _197 * _197;
    float _403 = _197 * _371;
    float _405 = _195 * _361;
    float _407 = _365 * _381;
    float _409 = fma(_195, _195, _401);
    float _411 = precise::clamp(_409, 0.0, 1.0);
    float _413 = _311 * _403;
    float _415 = in.m_41.z;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = _341 * _403;
    float _423 = -_411;
    float _425 = _423 + 1.0;
    float _427 = fma(_323, _405, _413);
    float _429 = _197 * _383;
    float _431 = fma(_331, _405, _421);
    float _433 = in.m_55.y;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = sqrt(_425);
    float _441 = fma(_347, _405, _429);
    float _443 = _377 * _439;
    float _445 = in.m_53.z;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = fma(_333, _443, _427);
    float _453 = fma(_335, _443, _431);
    float _455 = fma(_345, _443, _441);
    float _457 = in.m_55.z;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = _451 * _407;
    float _465 = in.m_53.x;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = _93 * _419;
    float _473 = fma(_453, _385, _463);
    float _475 = fma((*spvDescriptorSet0.fp_c10)._m0[3].x, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _477 = _471 + _105;
    float _479 = fma(_455, _387, _473);
    float _481 = fma((*spvDescriptorSet0.fp_c10)._m0[3].x, 0.800000011920928955078125, 0.300000011920928955078125);
    float _483 = -_471;
    float _485 = _483 + 1.0;
    float _487 = abs(_479);
    float _489 = 0.0 + _487;
    float _491 = precise::clamp(_489, 0.0, 1.0);
    float _493 = precise::max(_475, _477);
    float _495 = _93 * _393;
    float _497 = fma(_491, -2.0, 3.0);
    float _499 = _491 * _491;
    float _501 = precise::min(_481, _493);
    float _503 = _497 * _499;
    float _505 = precise::clamp(_503, 0.0, 1.0);
    float _507 = _93 * _437;
    float _509 = precise::max(_505, 0.5);
    float _511 = _93 * _449;
    float _513 = -_507;
    float _515 = _513 + _495;
    float _517 = precise::min(_509, 1.0);
    float _519 = _93 * _461;
    float _521 = _93 * _469;
    float _523 = fma(_517, 2.0, -1.0);
    float _525 = _93 * _399;
    float _527 = -_519;
    float _529 = _527 + _511;
    float _531 = _523 * _485;
    float _533 = -_525;
    float _535 = _533 + _521;
    float _537 = -_475;
    float _539 = _537 + _501;
    float _541 = fma(_531, _515, _507);
    float _543 = fma(_531, _535, _525);
    float _545 = fma(_531, _529, _519);
    float _547 = fma(_539, 2.9999997615814208984375, _541);
    float _549 = precise::clamp(_547, 0.0, 1.0);
    float _551 = fma(_539, 2.4999997615814208984375, _543);
    float _553 = precise::clamp(_551, 0.0, 1.0);
    float _555 = fma(_539, 3.499999523162841796875, _545);
    float _557 = precise::clamp(_555, 0.0, 1.0);
    if (!_173)
    {
        out.m_58.x = _553;
        out.m_58.y = _549;
        out.m_58.z = _557;
        out.m_58.w = _157;
        return out;
    }
    float _559 = in.m_60.w;
    float _561 = gl_FragCoord.w;
    float _563 = _559 * _561;
    float _565 = _93 * _563;
    bool _567 = _565 != 1.0;
    bool _569 = isnan(_565);
    bool _571 = _567 || _569;
    bool _573 = isnan(1.0);
    bool _575 = _571 || _573;
    bool _577 = !_575;
    if (!_577)
    {
        float _579 = gl_FragCoord.x;
        float _581 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _583 = _579 / _581;
        float _585 = gl_FragCoord.y;
        float _587 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _589 = _585 / _587;
        float _591 = _565 * 256.0;
        float _593 = trunc(_591);
        int _596 = int(_593);
        float _598 = trunc(_583);
        int _600 = int(_598);
        float _602 = trunc(_589);
        int _604 = int(_602);
        int _606 = _600 + 2;
        int _608 = _606 >> 1;
        uint _611 = uint(int(uint(_604) >> uint(1)));
        int _613 = _608 ^ int(_611);
        int _615 = _613 << 16;
        int _617 = _615 ^ _608;
        int _619 = 983055 & _617;
        int _621 = _619 << 6;
        int _623 = _621 + _619;
        int _625 = _623 & 13369548;
        uint _627 = uint(int(uint(_625) >> uint(3)));
        int _629 = _625 | int(_627);
        uint _631 = uint(int(uint(_596) >> uint(7)));
        int _633 = int(_631) + _596;
        int _635 = _629 & 5570560;
        int _637 = _629 & 85;
        uint _639 = uint(int(uint(_635) >> uint(15)));
        int _641 = int(_639) + _637;
        bool _643 = uint(_633) > uint(_641);
        if (!_643)
        {
            discard_fragment();
        }
        if (!_643)
        {
            out.m_58.x = _553;
            out.m_58.y = _549;
            out.m_58.z = _557;
            out.m_58.w = _163;
            return out;
        }
    }
    float _645 = 0.0 + _163;
    float _647 = precise::clamp(_645, 0.0, 1.0);
    out.m_58.x = 1.0;
    out.m_58.y = 1.0;
    out.m_58.z = 1.0;
    out.m_58.w = _647;
    return out;
}

