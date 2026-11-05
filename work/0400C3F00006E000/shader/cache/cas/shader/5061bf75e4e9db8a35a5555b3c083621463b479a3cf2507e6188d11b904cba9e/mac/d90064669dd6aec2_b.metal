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
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
    float4 m_53 [[user(locn11)]];
    float4 m_65 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _706 = float2(_90, _92);
    float4 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_706, float2(0.0), isnan(_706))).xyzw;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float _103 = _95.w;
    float _105 = in.m_42.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_44.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_46.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = _88 * _109;
    float _125 = _88 * _115;
    float _127 = _88 * _121;
    float _129 = in.m_40.w;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _88 * _133;
    float _137 = _103 * _123;
    float _139 = _125 * _137;
    float _141 = 0.0 + _139;
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = _143 * _127;
    bool _149 = _145 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _151 = isnan(_145);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _157 = _153 || _155;
    float _159 = in.m_40.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    if (!_157)
    {
        discard_fragment();
    }
    float _165 = _88 * _163;
    float2 _811 = float2(_165, _135);
    float2 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_811, float2(0.0), isnan(_811))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_811, float2(0.0), isnan(_811))).xy;
    float _171 = _169.x;
    float _173 = _169.y;
    float _175 = in.m_44.x;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_44.y;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_48.x;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_44.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_48.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_48.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = _88 * _179;
    float _213 = _88 * _185;
    float _215 = _88 * _191;
    float _217 = _88 * _197;
    float _219 = _88 * _203;
    float _221 = _88 * _209;
    float _223 = -_215;
    float _225 = _211 + _223;
    float _227 = -_219;
    float _229 = _213 + _227;
    float _231 = -_221;
    float _233 = _217 + _231;
    float _235 = fma(_97, _225, _215);
    float _237 = fma(_99, _229, _219);
    float _239 = fma(_101, _233, _221);
    if (!_157)
    {
        out.m_51.x = _235;
        out.m_51.y = _237;
        out.m_51.z = _239;
        out.m_51.w = _139;
        return out;
    }
    float _241 = in.m_53.w;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = _88 * _245;
    bool _249 = _247 != 1.0;
    bool _251 = isnan(_247);
    bool _253 = _249 || _251;
    bool _255 = isnan(1.0);
    bool _257 = _253 || _255;
    bool _259 = !_257;
    if (!_259)
    {
        float _261 = gl_FragCoord.x;
        float _263 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _265 = _261 / _263;
        float _267 = gl_FragCoord.y;
        float _269 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _271 = _267 / _269;
        float _273 = _247 * 256.0;
        float _275 = trunc(_273);
        int _278 = int(_275);
        uint _281 = uint(int(uint(_278) >> uint(7)));
        int _283 = int(_281) + _278;
        float _285 = trunc(_265);
        int _287 = int(_285);
        float _289 = trunc(_271);
        int _291 = int(_289);
        int _293 = _287 + 2;
        int _295 = _293 >> 1;
        uint _297 = uint(int(uint(_291) >> uint(1)));
        int _299 = _295 ^ int(_297);
        int _301 = _299 << 16;
        int _303 = _301 ^ _295;
        int _305 = 983055 & _303;
        int _307 = _305 << 6;
        int _309 = _307 + _305;
        int _311 = _309 & 13369548;
        uint _313 = uint(int(uint(_311) >> uint(3)));
        int _315 = _311 | int(_313);
        int _317 = _315 & 5570560;
        int _319 = _315 & 85;
        uint _321 = uint(int(uint(_317) >> uint(15)));
        int _323 = int(_321) + _319;
        bool _325 = uint(_283) > uint(_323);
        if (!_325)
        {
            discard_fragment();
        }
        if (!_325)
        {
            out.m_51.x = _235;
            out.m_51.y = _237;
            out.m_51.z = _239;
            out.m_51.w = _145;
            return out;
        }
    }
    float _327 = in.m_55.y;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = in.m_57.z;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    float _339 = in.m_55.x;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_57.y;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_55.z;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = in.m_57.x;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_59.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_59.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_59.z;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = _173 * _173;
    float _383 = fma(_171, _171, _381);
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = -_385;
    float _389 = _387 + 1.0;
    float _391 = sqrt(_389);
    float _393 = _88 * _331;
    float _395 = _88 * _337;
    float _397 = _88 * _343;
    float _399 = _88 * _349;
    float _401 = _393 * _393;
    float _403 = _88 * _355;
    float _405 = _88 * _361;
    float _407 = _399 * _399;
    float _409 = fma(_397, _397, _401);
    float _411 = _88 * _367;
    float _413 = _88 * _373;
    float _415 = fma(_405, _405, _407);
    float _417 = fma(_403, _403, _409);
    float _419 = _411 * _411;
    float _421 = _88 * _379;
    float _423 = fma(_395, _395, _415);
    float _425 = fma(_413, _413, _419);
    float _427 = rsqrt(_417);
    float _429 = fma(_421, _421, _425);
    float _431 = rsqrt(_423);
    float _433 = rsqrt(_429);
    float _435 = _427 * _173;
    float _437 = _393 * _435;
    float _439 = _431 * _171;
    float _441 = _397 * _435;
    float _443 = fma(_399, _439, _437);
    float _445 = fma(_405, _439, _441);
    float _447 = _433 * _391;
    float _449 = _403 * _435;
    float _451 = fma(_411, _447, _443);
    float _453 = fma(_395, _439, _449);
    float _455 = fma(_413, _447, _445);
    float _457 = in.m_53.x;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = _451 * _451;
    float _465 = fma(_421, _447, _453);
    float _467 = fma(_455, _455, _463);
    float _469 = fma(_465, _465, _467);
    float _471 = rsqrt(_469);
    float _473 = _455 * _471;
    float _475 = _451 * _471;
    float _477 = _465 * _471;
    float _479 = abs(_473);
    float _481 = abs(_475);
    float _483 = precise::max(_479, _481);
    float _485 = abs(_477);
    float _487 = precise::max(_485, _483);
    float _489 = _88 * _461;
    float _491 = 1.0 / _487;
    float _493 = precise::min(_489, 1.0);
    float _495 = _473 * _491;
    float _497 = _475 * _491;
    float _499 = -_491;
    float _501 = _477 * _499;
    float3 _1305 = float3(_495, _497, _501);
    float3 _505 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1305, float3(0.0), isnan(_1305)), level(_493)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1305, float3(0.0), isnan(_1305)), level(_493)).xyz;
    float _507 = _505.x;
    float _509 = _505.y;
    float _511 = _505.z;
    float _513 = in.m_61.y;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = in.m_63.y;
    float _521 = gl_FragCoord.w;
    float _523 = _519 * _521;
    float _525 = in.m_61.z;
    float _527 = gl_FragCoord.w;
    float _529 = _525 * _527;
    float _531 = in.m_61.x;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = in.m_63.z;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_63.x;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_65.x;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_65.w;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_65.y;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_65.z;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = _88 * _517;
    float _575 = _88 * _529;
    float _577 = _88 * _535;
    float _579 = fma(_509, 0.20999999344348907470703125, _573);
    float _581 = _88 * _523;
    float _583 = fma(_511, 0.20999999344348907470703125, _575);
    float _585 = fma(_507, 0.20999999344348907470703125, _577);
    float _587 = _88 * _541;
    bool _589 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _591 = _88 * _547;
    float _593 = _579 + _581;
    float _595 = _583 + _587;
    float _597 = 0.0 + _145;
    float _599 = precise::clamp(_597, 0.0, 1.0);
    float _601 = _585 + _591;
    float _603 = _88 * _559;
    float _605 = _239 * _595;
    float _607 = _88 * _553;
    float _609 = _235 * _601;
    float _611 = _237 * _593;
    float _613 = _88 * _565;
    float _615 = _88 * _571;
    float _617 = fma(_609, _603, _607);
    float _619 = _607;
    if (!_589)
    {
        _619 = _599;
    }
    float _621 = _619;
    float _623 = fma(_611, _603, _613);
    float _625 = fma(_605, _603, _615);
    bool _627 = !_589;
    float _629 = _621;
    if (!_627)
    {
        float _631 = in.m_67.w;
        float _633 = gl_FragCoord.w;
        float _635 = _631 * _633;
        float _637 = in.m_67.z;
        float _639 = gl_FragCoord.w;
        float _641 = _637 * _639;
        float _643 = _88 * _635;
        float _645 = _88 * _641;
        float _647 = 1.0 / _643;
        float _649 = _645 * _647;
        float _651 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _653 = fma(_649, (*spvDescriptorSet0.fp_c8)._m0[30].w, _651);
        float _655 = 1.0 / _653;
        float _657 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _659 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _661 = fma(_655, _657, _659);
        float _663 = _661 * 8.0;
        float _665 = precise::clamp(_663, 0.0, 1.0);
        float _667 = _599 * _665;
        _629 = _667;
    }
    float _669 = _629;
    float _671 = 0.0 + _669;
    float _673 = precise::clamp(_671, 0.0, 1.0);
    out.m_51.x = _617;
    out.m_51.y = _623;
    out.m_51.z = _625;
    out.m_51.w = _673;
    return out;
}

