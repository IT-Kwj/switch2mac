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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c8 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_45 [[user(locn8)]];
    float4 m_56 [[user(locn9)]];
    float4 m_58 [[user(locn10)]];
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
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float2 _680 = float2(_83, _85);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_680, float2(0.0), isnan(_680))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_680, float2(0.0), isnan(_680))).w;
    float _89 = in.m_39.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_41.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _81 * _93;
    float _103 = _81 * _99;
    float _105 = in.m_37.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = _81 * _109;
    bool _115 = _87 >= _101;
    bool _117 = isnan(_87);
    bool _119 = _115 || _117;
    bool _121 = isnan(_101);
    bool _123 = _119 || _121;
    float _125 = float(_123);
    float _127 = 0.0 + _125;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = _129 * _103;
    bool _133 = _131 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _141 = _137 || _139;
    float _143 = in.m_37.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    if (!_141)
    {
        discard_fragment();
    }
    float _149 = _81 * _147;
    float2 _776 = float2(_149, _111);
    float2 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_776, float2(0.0), isnan(_776))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_776, float2(0.0), isnan(_776))).xy;
    float _155 = _153.x;
    float _157 = _153.y;
    float _159 = in.m_43.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_43.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_43.z;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_45.y;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = in.m_45.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_47.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_45.z;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_47.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_47.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_49.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_49.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_49.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = _81 * _163;
    float _233 = _81 * _169;
    float _235 = _81 * _175;
    float _237 = _231 * _231;
    float _239 = _81 * _187;
    float _241 = _81 * _193;
    float _243 = fma(_233, _233, _237);
    float _245 = _81 * _199;
    float _247 = _241 * _241;
    float _249 = _81 * _211;
    float _251 = fma(_235, _235, _243);
    float _253 = _81 * _181;
    float _255 = _81 * _223;
    float _257 = _81 * _229;
    float _259 = rsqrt(_251);
    float _261 = _253 * _253;
    float _263 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _265 = _255 + _263;
    float _267 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _269 = _257 + _267;
    float _271 = fma(_239, _239, _261);
    float _273 = _81 * _205;
    float _275 = fma(_245, _245, _271);
    float _277 = fma(_273, _273, _247);
    float _279 = rsqrt(_275);
    float _281 = fma(_249, _249, _277);
    float _283 = _231 * _259;
    float _285 = _233 * _259;
    float _287 = _235 * _259;
    float _289 = _283 * _283;
    float _291 = rsqrt(_281);
    float _293 = in.m_39.z;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = fma(_285, _285, _289);
    float _301 = _81 * _217;
    float _303 = fma(_287, _287, _299);
    float _305 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _307 = _301 + _305;
    float _309 = rsqrt(_303);
    float _311 = _249 * _291;
    float _313 = _157 * _157;
    float _315 = _291 * _157;
    float _317 = _279 * _155;
    float _319 = _157 * _311;
    float _321 = fma(_155, _155, _313);
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = _241 * _315;
    float _327 = _273 * _315;
    float _329 = _265 * _265;
    float _331 = -_323;
    float _333 = _331 + 1.0;
    float _335 = fma(_253, _317, _325);
    float _337 = fma(_239, _317, _327);
    float _339 = fma(_307, _307, _329);
    float _341 = fma(_245, _317, _319);
    float _343 = in.m_39.x;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = sqrt(_333);
    float _351 = fma(_269, _269, _339);
    float _353 = in.m_39.y;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = in.m_51.y;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = rsqrt(_351);
    float _367 = _349 * _309;
    float _369 = fma(_283, _367, _335);
    float _371 = fma(_285, _367, _337);
    float _373 = fma(_287, _367, _341);
    float _375 = _369 * _369;
    float _377 = _269 * _365;
    float _379 = in.m_51.z;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = in.m_51.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = fma(_371, _371, _375);
    float _393 = _265 * _365;
    float _395 = _307 * _365;
    float _397 = fma(_373, _373, _391);
    float _399 = _393 * _369;
    float _401 = fma(_395, _371, _399);
    float _403 = rsqrt(_397);
    float _405 = _369 * _403;
    float _407 = _373 * _403;
    float _409 = fma(_377, _373, _401);
    float _411 = _81 * _363;
    float _413 = _405 * (-0.816474258899688720703125);
    float _415 = _81 * _389;
    float _417 = -_413;
    float _419 = fma(_407, 0.577381789684295654296875, _417);
    float _421 = _81 * _347;
    float _423 = _81 * _297;
    float _425 = fma(_419, 0.5, 0.5);
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = _427 * 0.85000002384185791015625;
    float _431 = _81 * _357;
    float _433 = _421 * _429;
    float _435 = _431 * _429;
    float _437 = _423 * _429;
    float _439 = fma(_421, 0.1500000059604644775390625, _433);
    float _441 = fma(_409, -0.5, 0.5);
    float _443 = fma(_431, 0.1500000059604644775390625, _435);
    float _445 = fma(_423, 0.1500000059604644775390625, _437);
    float _447 = _81 * _383;
    float _449 = fma(_415, _441, _439);
    float _451 = fma(_411, _441, _443);
    float _453 = fma(_447, _441, _445);
    if (!_141)
    {
        out.m_54.x = _449;
        out.m_54.y = _451;
        out.m_54.z = _453;
        out.m_54.w = _125;
        return out;
    }
    float _455 = in.m_56.w;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = _81 * _459;
    bool _463 = _461 != 1.0;
    bool _465 = isnan(_461);
    bool _467 = _463 || _465;
    bool _469 = isnan(1.0);
    bool _471 = _467 || _469;
    bool _473 = !_471;
    if (!_473)
    {
        float _475 = gl_FragCoord.x;
        float _477 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _479 = _475 / _477;
        float _481 = gl_FragCoord.y;
        float _483 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _485 = _481 / _483;
        float _487 = _461 * 256.0;
        float _489 = trunc(_487);
        int _492 = int(_489);
        float _494 = trunc(_479);
        int _496 = int(_494);
        float _498 = trunc(_485);
        int _500 = int(_498);
        int _502 = _496 + 2;
        int _504 = _502 >> 1;
        uint _507 = uint(int(uint(_500) >> uint(1)));
        int _509 = _504 ^ int(_507);
        int _511 = _509 << 16;
        int _513 = _511 ^ _504;
        int _515 = 983055 & _513;
        int _517 = _515 << 6;
        int _519 = _517 + _515;
        int _521 = _519 & 13369548;
        uint _523 = uint(int(uint(_521) >> uint(3)));
        int _525 = _521 | int(_523);
        uint _527 = uint(int(uint(_492) >> uint(7)));
        int _529 = int(_527) + _492;
        int _531 = _525 & 5570560;
        int _533 = _525 & 85;
        uint _535 = uint(int(uint(_531) >> uint(15)));
        int _537 = int(_535) + _533;
        bool _539 = uint(_529) > uint(_537);
        if (!_539)
        {
            discard_fragment();
        }
        if (!_539)
        {
            out.m_54.x = _449;
            out.m_54.y = _451;
            out.m_54.z = _453;
            out.m_54.w = _131;
            return out;
        }
    }
    float _541 = _451 * 0.715200006961822509765625;
    float _543 = in.m_58.w;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_58.x;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_58.y;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = fma(_449, 0.2125999927520751953125, _541);
    float _563 = in.m_58.z;
    float _565 = gl_FragCoord.w;
    float _567 = _563 * _565;
    float _569 = fma(_453, 0.072200000286102294921875, _561);
    bool _571 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _573 = 1.0 / _569;
    float _575 = _573 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _577 = precise::clamp(_575, 0.0, 1.0);
    float _579 = 0.0 + _131;
    float _581 = precise::clamp(_579, 0.0, 1.0);
    float _583 = fma(_577, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _585 = _81 * _547;
    float _587 = _81 * _559;
    float _589 = _81 * _567;
    float _591 = _583 * _585;
    float _593 = _81 * _553;
    float _595 = fma(_451, _591, _587);
    float _597 = fma(_449, _591, _593);
    float _599 = fma(_453, _591, _589);
    bool _601 = !_571;
    float _603 = _581;
    if (!_601)
    {
        float _605 = in.m_60.w;
        float _607 = gl_FragCoord.w;
        float _609 = _605 * _607;
        float _611 = in.m_60.z;
        float _613 = gl_FragCoord.w;
        float _615 = _611 * _613;
        float _617 = _81 * _609;
        float _619 = _81 * _615;
        float _621 = 1.0 / _617;
        float _623 = _619 * _621;
        float _625 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _627 = fma(_623, (*spvDescriptorSet0.fp_c8)._m0[30].w, _625);
        float _629 = 1.0 / _627;
        float _631 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _633 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _635 = fma(_629, _631, _633);
        float _637 = _635 * 8.0;
        float _639 = precise::clamp(_637, 0.0, 1.0);
        float _641 = _581 * _639;
        _603 = _641;
    }
    float _643 = _603;
    float _645 = 0.0 + _643;
    float _647 = precise::clamp(_645, 0.0, 1.0);
    out.m_54.x = _597;
    out.m_54.y = _595;
    out.m_54.z = _599;
    out.m_54.w = _647;
    return out;
}

