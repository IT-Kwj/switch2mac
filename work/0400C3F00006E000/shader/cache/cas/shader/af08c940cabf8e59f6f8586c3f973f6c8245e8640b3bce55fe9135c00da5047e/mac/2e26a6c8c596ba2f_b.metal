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
    float2 _736 = float2(_90, _92);
    float4 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_736, float2(0.0), isnan(_736))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_736, float2(0.0), isnan(_736))).xyzw;
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
    float2 _841 = float2(_165, _135);
    float2 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_841, float2(0.0), isnan(_841))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_841, float2(0.0), isnan(_841))).xy;
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
    float _211 = in.m_42.x;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = in.m_42.y;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_42.z;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = _88 * _179;
    float _231 = _88 * _185;
    float _233 = _88 * _191;
    float _235 = _88 * _197;
    float _237 = _88 * _203;
    float _239 = _88 * _209;
    float _241 = -_233;
    float _243 = _229 + _241;
    float _245 = -_237;
    float _247 = _231 + _245;
    float _249 = -_239;
    float _251 = _235 + _249;
    float _253 = fma(_97, _243, _233);
    float _255 = fma(_99, _247, _237);
    float _257 = fma(_101, _251, _239);
    float _259 = _88 * _215;
    float _261 = _88 * _221;
    float _263 = _88 * _227;
    float _265 = _253 * _259;
    float _267 = _255 * _261;
    float _269 = _257 * _263;
    if (!_157)
    {
        out.m_51.x = _265;
        out.m_51.y = _267;
        out.m_51.z = _269;
        out.m_51.w = _139;
        return out;
    }
    float _271 = in.m_53.w;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = _88 * _275;
    bool _279 = _277 != 1.0;
    bool _281 = isnan(_277);
    bool _283 = _279 || _281;
    bool _285 = isnan(1.0);
    bool _287 = _283 || _285;
    bool _289 = !_287;
    if (!_289)
    {
        float _291 = gl_FragCoord.x;
        float _293 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _295 = _291 / _293;
        float _297 = gl_FragCoord.y;
        float _299 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _301 = _297 / _299;
        float _303 = _277 * 256.0;
        float _305 = trunc(_303);
        int _308 = int(_305);
        uint _311 = uint(int(uint(_308) >> uint(7)));
        int _313 = int(_311) + _308;
        float _315 = trunc(_295);
        int _317 = int(_315);
        float _319 = trunc(_301);
        int _321 = int(_319);
        int _323 = _317 + 2;
        int _325 = _323 >> 1;
        uint _327 = uint(int(uint(_321) >> uint(1)));
        int _329 = _325 ^ int(_327);
        int _331 = _329 << 16;
        int _333 = _331 ^ _325;
        int _335 = 983055 & _333;
        int _337 = _335 << 6;
        int _339 = _337 + _335;
        int _341 = _339 & 13369548;
        uint _343 = uint(int(uint(_341) >> uint(3)));
        int _345 = _341 | int(_343);
        int _347 = _345 & 5570560;
        int _349 = _345 & 85;
        uint _351 = uint(int(uint(_347) >> uint(15)));
        int _353 = int(_351) + _349;
        bool _355 = uint(_313) > uint(_353);
        if (!_355)
        {
            discard_fragment();
        }
        if (!_355)
        {
            out.m_51.x = _265;
            out.m_51.y = _267;
            out.m_51.z = _269;
            out.m_51.w = _145;
            return out;
        }
    }
    float _357 = in.m_55.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_57.z;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_55.x;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_57.y;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_55.z;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_57.x;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_59.y;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_59.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_59.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = _173 * _173;
    float _413 = fma(_171, _171, _411);
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = -_415;
    float _419 = _417 + 1.0;
    float _421 = sqrt(_419);
    float _423 = _88 * _361;
    float _425 = _88 * _367;
    float _427 = _88 * _373;
    float _429 = _88 * _379;
    float _431 = _423 * _423;
    float _433 = _88 * _385;
    float _435 = _88 * _391;
    float _437 = _429 * _429;
    float _439 = fma(_427, _427, _431);
    float _441 = _88 * _397;
    float _443 = _88 * _403;
    float _445 = fma(_435, _435, _437);
    float _447 = fma(_433, _433, _439);
    float _449 = _441 * _441;
    float _451 = _88 * _409;
    float _453 = fma(_425, _425, _445);
    float _455 = fma(_443, _443, _449);
    float _457 = rsqrt(_447);
    float _459 = fma(_451, _451, _455);
    float _461 = rsqrt(_453);
    float _463 = rsqrt(_459);
    float _465 = _457 * _173;
    float _467 = _423 * _465;
    float _469 = _461 * _171;
    float _471 = _427 * _465;
    float _473 = fma(_429, _469, _467);
    float _475 = fma(_435, _469, _471);
    float _477 = _463 * _421;
    float _479 = _433 * _465;
    float _481 = fma(_441, _477, _473);
    float _483 = fma(_425, _469, _479);
    float _485 = fma(_443, _477, _475);
    float _487 = in.m_53.x;
    float _489 = gl_FragCoord.w;
    float _491 = _487 * _489;
    float _493 = _481 * _481;
    float _495 = fma(_451, _477, _483);
    float _497 = fma(_485, _485, _493);
    float _499 = fma(_495, _495, _497);
    float _501 = rsqrt(_499);
    float _503 = _485 * _501;
    float _505 = _481 * _501;
    float _507 = _495 * _501;
    float _509 = abs(_503);
    float _511 = abs(_505);
    float _513 = precise::max(_509, _511);
    float _515 = abs(_507);
    float _517 = precise::max(_515, _513);
    float _519 = _88 * _491;
    float _521 = 1.0 / _517;
    float _523 = precise::min(_519, 1.0);
    float _525 = _503 * _521;
    float _527 = _505 * _521;
    float _529 = -_521;
    float _531 = _507 * _529;
    float3 _1374 = float3(_525, _527, _531);
    float3 _535 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1374, float3(0.0), isnan(_1374)), level(_523)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1374, float3(0.0), isnan(_1374)), level(_523)).xyz;
    float _537 = _535.x;
    float _539 = _535.y;
    float _541 = _535.z;
    float _543 = in.m_61.y;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_63.y;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_61.z;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_61.x;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_63.z;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_63.x;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = in.m_65.x;
    float _581 = gl_FragCoord.w;
    float _583 = _579 * _581;
    float _585 = in.m_65.w;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = in.m_65.y;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = in.m_65.z;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = _88 * _547;
    float _605 = _88 * _559;
    float _607 = _88 * _565;
    float _609 = fma(_539, 0.20999999344348907470703125, _603);
    float _611 = _88 * _553;
    float _613 = fma(_541, 0.20999999344348907470703125, _605);
    float _615 = fma(_537, 0.20999999344348907470703125, _607);
    float _617 = _88 * _571;
    bool _619 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _621 = _88 * _577;
    float _623 = _609 + _611;
    float _625 = _613 + _617;
    float _627 = 0.0 + _145;
    float _629 = precise::clamp(_627, 0.0, 1.0);
    float _631 = _615 + _621;
    float _633 = _88 * _589;
    float _635 = _269 * _625;
    float _637 = _88 * _583;
    float _639 = _265 * _631;
    float _641 = _267 * _623;
    float _643 = _88 * _595;
    float _645 = _88 * _601;
    float _647 = fma(_639, _633, _637);
    float _649 = _637;
    if (!_619)
    {
        _649 = _629;
    }
    float _651 = _649;
    float _653 = fma(_641, _633, _643);
    float _655 = fma(_635, _633, _645);
    bool _657 = !_619;
    float _659 = _651;
    if (!_657)
    {
        float _661 = in.m_67.w;
        float _663 = gl_FragCoord.w;
        float _665 = _661 * _663;
        float _667 = in.m_67.z;
        float _669 = gl_FragCoord.w;
        float _671 = _667 * _669;
        float _673 = _88 * _665;
        float _675 = _88 * _671;
        float _677 = 1.0 / _673;
        float _679 = _675 * _677;
        float _681 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _683 = fma(_679, (*spvDescriptorSet0.fp_c8)._m0[30].w, _681);
        float _685 = 1.0 / _683;
        float _687 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _689 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _691 = fma(_685, _687, _689);
        float _693 = _691 * 8.0;
        float _695 = precise::clamp(_693, 0.0, 1.0);
        float _697 = _629 * _695;
        _659 = _697;
    }
    float _699 = _659;
    float _701 = 0.0 + _699;
    float _703 = precise::clamp(_701, 0.0, 1.0);
    out.m_51.x = _647;
    out.m_51.y = _653;
    out.m_51.z = _655;
    out.m_51.w = _703;
    return out;
}

