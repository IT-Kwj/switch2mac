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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_38 [[id(3)]];
    sampler fp_t_tcb_38Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_38Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_40 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
    float4 m_65 [[user(locn11)]];
    float4 m_48 [[user(locn12)]];
    float4 m_67 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_40.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_42.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_42.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_42.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _76;
    float _116 = _114 * _82;
    float _118 = _114 * _88;
    float _120 = _114 * _94;
    float _122 = _114 * _100;
    float _124 = _114 * _106;
    float _126 = _114 * _112;
    float2 _777 = float2(_116, _118);
    float4 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_38.sample(spvDescriptorSet0.fp_t_tcb_38Smplr, select(_777, float2(0.0), isnan(_777))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_38, spvDescriptorSet0.fp_t_tcb_38Smplr_w, select(_777, float2(0.0), isnan(_777))).xyzw;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    float _137 = _129.w;
    float2 _796 = float2(_120, _122);
    float4 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_796, float2(0.0), isnan(_796))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_796, float2(0.0), isnan(_796))).xyzw;
    float _141 = _139.x;
    float _143 = _139.y;
    float _145 = _139.z;
    float _147 = _139.w;
    float2 _812 = float2(_124, _126);
    float2 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_812, float2(0.0), isnan(_812))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_812, float2(0.0), isnan(_812))).xy;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = in.m_44.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_46.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_48.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_46.w;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_50.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_46.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_50.y;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_46.z;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_50.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = in.m_52.x;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = _114 * _161;
    float _219 = _114 * _215;
    float _221 = _147 * _137;
    float _223 = _135 * _135;
    float _225 = _114 * _179;
    float _227 = _221 * _217;
    float _229 = _131 * _131;
    float _231 = _133 * _133;
    float _233 = _114 * _197;
    float _235 = _225 * _227;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _141 * _229;
    float _241 = _145 * _223;
    float _243 = _114 * _167;
    float _245 = _114 * _173;
    float _247 = _143 * _231;
    float _249 = _114 * _185;
    float _251 = _114 * _191;
    float _253 = _114 * _203;
    bool _257 = _245 != 1.0;
    bool _259 = isnan(_245);
    bool _261 = _257 || _259;
    bool _263 = isnan(1.0);
    bool _265 = _261 || _263;
    float _267 = _114 * _209;
    float _269 = -_249;
    float _271 = _243 + _269;
    float _273 = -_233;
    float _275 = _251 + _273;
    float _277 = -_267;
    float _279 = _253 + _277;
    float _281 = fma(_239, _271, _249);
    float _283 = fma(_247, _275, _233);
    float _285 = _237 * _219;
    float _287 = fma(_241, _279, _267);
    bool _289 = !_265;
    if (!_289)
    {
        float _291 = gl_FragCoord.x;
        float _293 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _295 = _291 / _293;
        float _297 = gl_FragCoord.y;
        float _299 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _301 = _297 / _299;
        float _303 = trunc(_295);
        int _306 = int(_303);
        float _308 = trunc(_301);
        int _310 = int(_308);
        int _312 = _306 + 2;
        int _314 = _312 >> 1;
        uint _317 = uint(int(uint(_310) >> uint(1)));
        int _319 = _314 ^ int(_317);
        int _321 = _319 << 16;
        int _323 = _321 ^ _314;
        int _325 = 983055 & _323;
        float _327 = _245 * 256.0;
        int _329 = _325 << 6;
        int _331 = _329 + _325;
        float _333 = trunc(_327);
        int _335 = int(_333);
        int _337 = _331 & 13369548;
        uint _339 = uint(int(uint(_337) >> uint(3)));
        int _341 = _337 | int(_339);
        int _343 = _341 & 5570560;
        int _345 = _341 & 85;
        uint _347 = uint(int(uint(_335) >> uint(7)));
        int _349 = int(_347) + _335;
        uint _351 = uint(int(uint(_343) >> uint(15)));
        int _353 = int(_351) + _345;
        bool _355 = uint(_349) > uint(_353);
        if (!_355)
        {
            discard_fragment();
        }
        if (!_355)
        {
            out.m_55.x = _281;
            out.m_55.y = _283;
            out.m_55.z = _287;
            out.m_55.w = _285;
            return out;
        }
    }
    float _357 = in.m_57.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = in.m_59.y;
    float _365 = gl_FragCoord.w;
    float _367 = _363 * _365;
    float _369 = in.m_59.z;
    float _371 = gl_FragCoord.w;
    float _373 = _369 * _371;
    float _375 = in.m_57.x;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = in.m_59.x;
    float _383 = gl_FragCoord.w;
    float _385 = _381 * _383;
    float _387 = in.m_61.y;
    float _389 = gl_FragCoord.w;
    float _391 = _387 * _389;
    float _393 = in.m_57.z;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = in.m_61.x;
    float _401 = gl_FragCoord.w;
    float _403 = _399 * _401;
    float _405 = in.m_61.z;
    float _407 = gl_FragCoord.w;
    float _409 = _405 * _407;
    float _411 = _155 * _155;
    float _413 = fma(_153, _153, _411);
    float _415 = precise::clamp(_413, 0.0, 1.0);
    float _417 = _114 * _361;
    float _419 = _114 * _367;
    float _421 = -_415;
    float _423 = _421 + 1.0;
    float _425 = _114 * _373;
    float _427 = _114 * _379;
    float _429 = _417 * _417;
    float _431 = _114 * _385;
    float _433 = _419 * _419;
    float _435 = _114 * _391;
    float _437 = _114 * _397;
    float _439 = fma(_427, _427, _429);
    float _441 = fma(_431, _431, _433);
    float _443 = _114 * _403;
    float _445 = _435 * _435;
    float _447 = fma(_437, _437, _439);
    float _449 = fma(_425, _425, _441);
    float _451 = _114 * _409;
    float _453 = fma(_443, _443, _445);
    float _455 = rsqrt(_447);
    float _457 = fma(_451, _451, _453);
    float _459 = rsqrt(_449);
    float _461 = sqrt(_423);
    float _463 = _455 * _155;
    float _465 = _427 * _463;
    float _467 = in.m_48.x;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = rsqrt(_457);
    float _475 = _459 * _153;
    float _477 = _417 * _463;
    float _479 = fma(_431, _475, _465);
    float _481 = fma(_419, _475, _477);
    float _483 = _437 * _463;
    float _485 = fma(_425, _475, _483);
    float _487 = _473 * _461;
    float _489 = fma(_435, _487, _481);
    float _491 = fma(_443, _487, _479);
    float _493 = fma(_451, _487, _485);
    float _495 = _489 * _489;
    float _497 = fma(_491, _491, _495);
    float _499 = fma(_493, _493, _497);
    float _501 = rsqrt(_499);
    float _503 = _491 * _501;
    float _505 = _489 * _501;
    float _507 = _493 * _501;
    float _509 = abs(_503);
    float _511 = abs(_505);
    float _513 = precise::max(_509, _511);
    float _515 = abs(_507);
    float _517 = precise::max(_515, _513);
    float _519 = _114 * _471;
    float _521 = 1.0 / _517;
    float _523 = _503 * _521;
    float _525 = _505 * _521;
    float _527 = -_521;
    float _529 = _507 * _527;
    float _531 = precise::min(_519, 1.0);
    float3 _1358 = float3(_523, _525, _529);
    float3 _535 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1358, float3(0.0), isnan(_1358)), level(_531)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1358, float3(0.0), isnan(_1358)), level(_531)).xyz;
    float _537 = _535.x;
    float _539 = _535.y;
    float _541 = _535.z;
    float _543 = in.m_63.x;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_63.y;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_65.y;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_63.z;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_65.x;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = in.m_65.z;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = in.m_67.x;
    float _581 = gl_FragCoord.w;
    float _583 = _579 * _581;
    float _585 = in.m_67.w;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = in.m_67.y;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = in.m_67.z;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = _114 * _547;
    float _605 = _114 * _553;
    float _607 = _114 * _565;
    float _609 = fma(_539, 0.20999999344348907470703125, _605);
    float _611 = _114 * _559;
    float _613 = fma(_537, 0.20999999344348907470703125, _603);
    float _615 = fma(_541, 0.20999999344348907470703125, _607);
    float _617 = _114 * _571;
    bool _619 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _621 = _114 * _577;
    float _623 = _609 + _611;
    float _625 = _613 + _617;
    float _627 = _114 * _589;
    float _629 = _615 + _621;
    float _631 = _283 * _623;
    float _633 = 0.0 + _285;
    float _635 = precise::clamp(_633, 0.0, 1.0);
    float _637 = _281 * _625;
    float _639 = _114 * _583;
    float _641 = _287 * _629;
    float _643 = _114 * _595;
    float _645 = _114 * _601;
    float _647 = fma(_637, _627, _639);
    float _649 = _639;
    if (!_619)
    {
        _649 = _635;
    }
    float _651 = _649;
    float _653 = fma(_631, _627, _643);
    float _655 = fma(_641, _627, _645);
    bool _657 = !_619;
    float _659 = _651;
    if (!_657)
    {
        float _661 = in.m_69.w;
        float _663 = gl_FragCoord.w;
        float _665 = _661 * _663;
        float _667 = in.m_69.z;
        float _669 = gl_FragCoord.w;
        float _671 = _667 * _669;
        float _673 = _114 * _665;
        float _675 = _114 * _671;
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
        float _697 = _635 * _695;
        _659 = _697;
    }
    float _699 = _659;
    float _701 = 0.0 + _699;
    float _703 = precise::clamp(_701, 0.0, 1.0);
    out.m_55.x = _647;
    out.m_55.y = _653;
    out.m_55.z = _655;
    out.m_55.w = _703;
    return out;
}

