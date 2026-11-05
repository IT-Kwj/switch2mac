#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
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
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_E [[id(13)]];
    sampler fp_t_tcb_ESmplr [[id(14)]];
    texturecube<float> fp_t_tcb_1E [[id(15)]];
    sampler fp_t_tcb_1ESmplr [[id(16)]];
    texturecube_array<float> fp_t_tcb_2E [[id(17)]];
    sampler fp_t_tcb_2ESmplr [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    sampler fp_t_tcb_8Smplr_w [[id(20)]];
    sampler fp_t_tcb_ASmplr_w [[id(21)]];
    sampler fp_t_tcb_10Smplr_w [[id(22)]];
    sampler fp_t_tcb_1ESmplr_w [[id(23)]];
    sampler fp_t_tcb_2ESmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_72 [[color(0)]];
};

struct main0_in
{
    float4 m_67 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_74 [[user(locn11)]];
    float4 m_80 [[user(locn12)]];
    float4 m_82 [[user(locn13)]];
    float4 m_78 [[user(locn14)]];
};

static inline __attribute__((always_inline))
int _90(thread const int& _2488, thread const int& _2489, constant _10& support_buffer)
{
    int _2492 = 1 + _2489;
    float _2494 = support_buffer._m5[_2492].x;
    float _2496 = abs(_2494);
    bool _2498 = _2496 == 1.0;
    if (_2498)
    {
        return _2488;
    }
    float _2500 = float(_2488);
    float _2502 = _2500 / _2496;
    int _2504 = int(_2502);
    return _2504;
}

static inline __attribute__((always_inline))
int _92(thread const int& _2527, thread const int& _2528, thread const int& _2529, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _2532 = 1 + _2528;
    float _2534 = support_buffer._m5[_2532].x;
    bool _2536 = _2534 == 1.0;
    if (_2536)
    {
        return _2527;
    }
    bool _2538 = _2534 < 0.0;
    if (_2538)
    {
        float _2540 = -_2534;
        float _2542 = float(_2527);
        float _2544 = _2542 * _2540;
        float _2546 = gl_FragCoord.x;
        float _2548 = gl_FragCoord.y;
        float _2550 = (_2529 != 0) ? _2548 : _2546;
        float _2552 = mod(_2550, _2540);
        float _2554 = _2544 + _2552;
        int _2556 = int(_2554);
        return _2556;
    }
    float _2558 = float(_2527);
    float _2560 = _2558 * _2534;
    int _2562 = int(_2560);
    return _2562;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _96 = gl_FragCoord.w;
    float _98 = in.m_53.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_53.y;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = 1.0 / _96;
    float _112 = _110 * _102;
    float _114 = _110 * _108;
    float2 _1096 = float2(_112, _114);
    float _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1096, float2(0.0), isnan(_1096))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1096, float2(0.0), isnan(_1096))).w;
    float _118 = in.m_55.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_57.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_59.y;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = _110 * _122;
    float _138 = _110 * _128;
    float _140 = _110 * _134;
    float _142 = _136 * _116;
    float _144 = 0.0 + _142;
    float _146 = precise::clamp(_144, 0.0, 1.0);
    float _148 = _146 * _138;
    bool _152 = _148 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _154 = isnan(_148);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _160 = _156 || _158;
    float _162 = in.m_59.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    if (!_160)
    {
        discard_fragment();
    }
    float _168 = _110 * _166;
    float2 _1180 = float2(_168, _140);
    float2 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1180, float2(0.0), isnan(_1180))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1180, float2(0.0), isnan(_1180))).xy;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = in.m_61.y;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_59.z;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_59.w;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_63.w;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_63.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_63.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _216 = (*spvDescriptorSet0.fp_c9)._m0[191].y + _214;
    float _218 = _110 * _182;
    float _220 = 1.0 / _216;
    float _222 = _110 * _200;
    float _224 = precise::max(_218, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _226 = _110 * _206;
    float _228 = _110 * _212;
    float _230 = precise::min(_224, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _232 = 1.0 / _222;
    float _234 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _236 = _230 + _234;
    float _238 = _236 * _220;
    float _240 = _110 * _188;
    float _242 = _238 * 0.0350000001490116119384765625;
    float _244 = _110 * _194;
    float _246 = _226 * _232;
    float _248 = _228 * _232;
    float _250 = fma(_174, _242, _240);
    float _252 = fma(_176, _242, _244);
    float _254 = fma(_174, _242, _246);
    float _256 = fma(_176, _242, _248);
    float2 _1306 = float2(_250, _252);
    float4 _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1306, float2(0.0), isnan(_1306))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1306, float2(0.0), isnan(_1306))).xyzw;
    float _261 = _259.x;
    float _263 = _259.y;
    float _265 = _259.z;
    float _267 = _259.w;
    float2 _1322 = float2(_254, _256);
    float _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1322, float2(0.0), isnan(_1322))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1322, float2(0.0), isnan(_1322))).x;
    int _271 = int2(spvDescriptorSet0.fp_t_tcb_E.get_width(), spvDescriptorSet0.fp_t_tcb_E.get_height()).x;
    int _273 = _271;
    int _275 = 4;
    int _277 = _90(_273, _275, (*spvDescriptorSet0.support_buffer));
    int _279 = int2(spvDescriptorSet0.fp_t_tcb_E.get_width(), spvDescriptorSet0.fp_t_tcb_E.get_height()).y;
    int _281 = _279;
    int _283 = 4;
    int _285 = _90(_281, _283, (*spvDescriptorSet0.support_buffer));
    float _287 = in.m_65.x;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = in.m_65.y;
    float _295 = gl_FragCoord.w;
    float _297 = _293 * _295;
    float _299 = in.m_67.x;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = in.m_67.y;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = in.m_65.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_67.z;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_69.w;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = _110 * _291;
    float _331 = _110 * _297;
    float _333 = _110 * _315;
    float _335 = _261 * _261;
    float _337 = _263 * _263;
    float _339 = _265 * _265;
    float _341 = -_335;
    float _343 = _341 + 1.0;
    float _345 = -_337;
    float _347 = _345 + 1.0;
    float _349 = -_339;
    float _351 = _349 + 1.0;
    float _353 = _329 * _343;
    float _355 = _110 * _303;
    float _357 = _331 * _347;
    float _359 = _110 * _309;
    float _361 = _333 * _351;
    float _363 = fma(_335, _355, _353);
    float _365 = _267 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _367 = fma(_337, _359, _357);
    float _369 = _110 * _321;
    float _371 = in.m_69.z;
    float _373 = gl_FragCoord.w;
    float _375 = _371 * _373;
    float _377 = _367 * _365;
    float _379 = fma(_339, _369, _361);
    float _381 = _363 * _365;
    float _383 = _379 * _365;
    if (!_160)
    {
        out.m_72.x = _381;
        out.m_72.y = _377;
        out.m_72.z = _383;
        out.m_72.w = _142;
        return out;
    }
    float _385 = in.m_74.y;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_76.y;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_76.x;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_74.x;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_74.z;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_76.z;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = _110 * _327;
    float _423 = _110 * _375;
    float _425 = 1.0 / _421;
    float _427 = -_423;
    float _429 = fma(_427, _425, _269);
    float _431 = _110 * _389;
    float _433 = _110 * _395;
    float _435 = _110 * _401;
    float _437 = _110 * _407;
    float _439 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _441 = _431 + _439;
    float _443 = _433 * _433;
    float _445 = _110 * _413;
    float _447 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _449 = _437 + _447;
    float _451 = _441 * _441;
    float _453 = _110 * _419;
    float _455 = fma(_435, _435, _443);
    float _457 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _459 = _445 + _457;
    float _461 = fma(_449, _449, _451);
    float _463 = ceil(_429);
    float _465 = fma(_453, _453, _455);
    float _467 = fma(_459, _459, _461);
    float _469 = rsqrt(_465);
    float _471 = rsqrt(_467);
    float _473 = 0.0 + _463;
    float _475 = precise::clamp(_473, 0.0, 1.0);
    float _477 = _242 * _475;
    float _479 = _435 * _469;
    float _481 = _433 * _469;
    float _483 = fma(_176, _477, _248);
    float _485 = float(_285);
    float _487 = _453 * _469;
    float _489 = _174 * _477;
    float _491 = _449 * _471;
    float _493 = _441 * _471;
    float _495 = _459 * _471;
    float _497 = _483 * _485;
    float _499 = _479 * _491;
    float _501 = fma(_489, (*spvDescriptorSet0.fp_c15)._m0[630].w, _246);
    float _503 = fma(_481, _493, _499);
    float _505 = trunc(_497);
    int _507 = int(_505);
    float _509 = fma(_487, _495, _503);
    float _511 = float(_277);
    int _513 = _277 + (-1);
    float _515 = _509 + _509;
    float _517 = _501 * _511;
    float _519 = -_515;
    float _521 = fma(_479, _519, _491);
    float _523 = -_515;
    float _525 = fma(_481, _523, _493);
    float _527 = -_495;
    float _529 = fma(_487, _515, _527);
    int _531 = _285 + (-1);
    float _533 = trunc(_517);
    int _535 = int(_533);
    float _537 = abs(_521);
    float _539 = abs(_525);
    float _541 = precise::max(_537, _539);
    float _543 = abs(_529);
    float _545 = precise::max(_543, _541);
    float _547 = abs(_479);
    float _549 = abs(_481);
    float _551 = precise::max(_547, _549);
    float _553 = 1.0 / _545;
    float _555 = abs(_487);
    float _557 = precise::max(_555, _551);
    int _559 = max(0, _507);
    int _561 = max(0, _535);
    float _563 = 1.0 / _557;
    float _565 = _521 * _553;
    float _567 = _525 * _553;
    int _569 = min(_531, _559);
    float _571 = _529 * _553;
    int _573 = min(_513, _561);
    float _575 = _479 * _563;
    float _577 = _481 * _563;
    float _579 = -_563;
    float _581 = _487 * _579;
    float _583 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, 7.0, 1.0);
    float3 _1764 = float3(_575, _577, _581);
    float3 _587 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1764, float3(0.0), isnan(_1764)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1764, float3(0.0), isnan(_1764)), level(0.0)).xyz;
    float _589 = _587.x;
    float _591 = _587.y;
    float _593 = _587.z;
    float4 _1782 = float4(_565, _567, _571, float(0));
    float4 _1786 = select(_1782, float4(0.0), isnan(_1782));
    float3 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_2E.sample(spvDescriptorSet0.fp_t_tcb_2ESmplr, _1786.xyz, uint(rint(_1786.w)), level(_583)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_2E, spvDescriptorSet0.fp_t_tcb_2ESmplr_w, _1786.xyz, uint(rint(_1786.w)), level(_583)).xyz;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    int _603 = _573;
    int _605 = 4;
    int _607 = 0;
    int _609 = _92(_603, _605, _607, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _611 = _569;
    int _613 = 4;
    int _615 = 1;
    int _617 = _92(_611, _613, _615, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _619 = spvDescriptorSet0.fp_t_tcb_E.read(uint2(int2(_609, _617)), 0).xyz;
    float _621 = _619.x;
    float _623 = _619.y;
    float _625 = _619.z;
    float _627 = _493 + (*spvDescriptorSet0.fp_c15)._m0[16].y;
    float _629 = _491 + (*spvDescriptorSet0.fp_c15)._m0[16].x;
    float _631 = _495 + (*spvDescriptorSet0.fp_c15)._m0[16].z;
    float _633 = -_493;
    float _635 = -_499;
    float _637 = fma(_481, _633, _635);
    float _639 = _627 * _627;
    float _641 = in.m_78.z;
    float _643 = gl_FragCoord.w;
    float _645 = _641 * _643;
    float _647 = sqrt(_467);
    float _649 = -_495;
    float _651 = fma(_487, _649, _637);
    float _653 = precise::clamp(_651, 0.0, 1.0);
    float _655 = fma(_629, _629, _639);
    float _657 = _479 * (*spvDescriptorSet0.fp_c15)._m0[16].x;
    float _659 = fma(_631, _631, _655);
    float _661 = rsqrt(_659);
    float _663 = _629 * _661;
    float _665 = _631 * _661;
    float _667 = _627 * _661;
    float _669 = -_481;
    float _671 = -_657;
    float _673 = fma(_669, (*spvDescriptorSet0.fp_c15)._m0[16].y, _671);
    float _675 = _479 * _663;
    float _677 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, (*spvDescriptorSet0.fp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _679 = precise::clamp(_677, 0.0, 1.0);
    float _681 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, 0.5, 0.5);
    float _683 = -_667;
    float _685 = -_675;
    float _687 = fma(_481, _683, _685);
    float _689 = _653 * (-9.27999973297119140625);
    float _691 = _679 * _679;
    float _693 = _667 * (*spvDescriptorSet0.fp_c15)._m0[16].y;
    float _695 = -_665;
    float _697 = fma(_487, _695, _687);
    float _699 = precise::clamp(_697, 0.0, 1.0);
    float _701 = _681 * _681;
    float _703 = _701 * 0.5;
    float _705 = exp2(_689);
    float _707 = _691 + (-1.0);
    float _709 = _699 * _699;
    float _711 = fma(_663, (*spvDescriptorSet0.fp_c15)._m0[16].x, _693);
    float _713 = -(*spvDescriptorSet0.fp_c13)._m0[4].y;
    float _715 = _713 + 1.0;
    float _717 = -_487;
    float _719 = fma(_717, (*spvDescriptorSet0.fp_c15)._m0[16].z, _673);
    float _721 = precise::clamp(_719, 0.0, 1.0);
    float _723 = fma(_709, _707, 1.0);
    float _725 = fma(_665, (*spvDescriptorSet0.fp_c15)._m0[16].z, _711);
    float _727 = precise::clamp(_725, 0.0, 1.0);
    float _729 = -_703;
    float _731 = _729 + 1.0;
    float _733 = _723 * _723;
    float _735 = _715 * _715;
    float _737 = -_727;
    float _739 = _737 + 1.0;
    float _741 = fma(_721, _731, _703);
    float _743 = fma(_653, _731, _703);
    float _745 = 1.0 / _733;
    float _747 = precise::min(_735, _705);
    float _749 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _751 = _739 * _739;
    float _753 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, -0.572000026702880859375, 1.03999996185302734375);
    float _755 = fma((*spvDescriptorSet0.fp_c13)._m0[4].y, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _757 = fma(_715, _747, _749);
    float _759 = _751 * _751;
    float _761 = _691 * 0.31830990314483642578125;
    float _763 = in.m_78.x;
    float _765 = gl_FragCoord.w;
    float _767 = _763 * _765;
    float _769 = fma(_757, -1.03999996185302734375, _753);
    float _771 = precise::clamp(_769, 0.0, 1.0);
    float _773 = _739 * _759;
    float _775 = fma(_757, 1.03999996185302734375, _755);
    float _777 = precise::clamp(_775, 0.0, 1.0);
    float _779 = _377 + (-0.039999999105930328369140625);
    float _781 = in.m_78.y;
    float _783 = gl_FragCoord.w;
    float _785 = _781 * _783;
    float _787 = _761 * _745;
    float _789 = _381 + (-0.039999999105930328369140625);
    float _791 = fma(_779, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.039999999105930328369140625);
    float _793 = -_779;
    float _795 = fma(_793, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.959999978542327880859375);
    float _797 = _743 * _741;
    float _799 = fma(_789, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.039999999105930328369140625);
    float _801 = -_789;
    float _803 = fma(_801, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.959999978542327880859375);
    float _805 = fma(_773, _795, _791);
    float _807 = fma(_791, _771, _777);
    float _809 = in.m_80.x;
    float _811 = gl_FragCoord.w;
    float _813 = _809 * _811;
    float _815 = in.m_80.z;
    float _817 = gl_FragCoord.w;
    float _819 = _815 * _817;
    float _821 = in.m_80.y;
    float _823 = gl_FragCoord.w;
    float _825 = _821 * _823;
    float _827 = _383 + (-0.039999999105930328369140625);
    float _829 = fma(_773, _803, _799);
    float _831 = fma(_799, _771, _777);
    float _833 = fma(_827, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.039999999105930328369140625);
    float _835 = -_827;
    float _837 = fma(_835, (*spvDescriptorSet0.fp_c13)._m0[4].z, 0.959999978542327880859375);
    float _839 = 1.0 / _797;
    float _841 = -(*spvDescriptorSet0.fp_c13)._m0[4].z;
    float _843 = _841 + 1.0;
    float _845 = fma(_833, _771, _777);
    float _847 = fma(_773, _837, _833);
    float _849 = _721 * _787;
    float _851 = _849 * 0.25;
    float _853 = _110 * _645;
    float _855 = -(*spvDescriptorSet0.fp_c15)._m0[651].x;
    float _857 = (*spvDescriptorSet0.fp_c15)._m0[651].y + _855;
    float _859 = -(*spvDescriptorSet0.fp_c15)._m0[651].x;
    float _861 = _647 + _859;
    float _863 = _110 * _767;
    float _865 = 1.0 / _857;
    float _867 = _110 * _785;
    float _869 = in.m_82.y;
    float _871 = gl_FragCoord.w;
    float _873 = _869 * _871;
    float _875 = _851 * _839;
    float _877 = _829 * _875;
    float _879 = _805 * _875;
    float _881 = _847 * _875;
    float _883 = _110 * _813;
    float _885 = _110 * _819;
    float _887 = _110 * _825;
    float _889 = _861 * _865;
    float _891 = precise::clamp(_889, 0.0, 1.0);
    float _893 = fma(_593, 0.20999999344348907470703125, _853);
    float _895 = fma(_589, 0.20999999344348907470703125, _863);
    float _897 = in.m_84.y;
    float _899 = gl_FragCoord.w;
    float _901 = _897 * _899;
    float _903 = fma(_591, 0.20999999344348907470703125, _867);
    float _905 = in.m_84.z;
    float _907 = gl_FragCoord.w;
    float _909 = _905 * _907;
    float _911 = in.m_84.x;
    float _913 = gl_FragCoord.w;
    float _915 = _911 * _913;
    float _917 = _895 + _883;
    float _919 = _893 + _885;
    float _921 = _903 + _887;
    float _923 = _381 * _917;
    float _925 = _383 * _919;
    float _927 = _377 * _921;
    float _929 = in.m_82.x;
    float _931 = gl_FragCoord.w;
    float _933 = _929 * _931;
    float _935 = in.m_82.w;
    float _937 = gl_FragCoord.w;
    float _939 = _935 * _937;
    float _941 = -_599;
    float _943 = _941 + (*spvDescriptorSet0.fp_c15)._m0[649].y;
    float _945 = in.m_82.z;
    float _947 = gl_FragCoord.w;
    float _949 = _945 * _947;
    float _951 = -_601;
    float _953 = _951 + (*spvDescriptorSet0.fp_c15)._m0[649].z;
    float _955 = -_597;
    float _957 = _955 + (*spvDescriptorSet0.fp_c15)._m0[649].x;
    float _959 = fma(_891, _943, _599);
    float _961 = (*spvDescriptorSet0.fp_c15)._m0[21].w * (*spvDescriptorSet0.fp_c15)._m0[22].x;
    float _963 = fma(_891, _953, _601);
    float _965 = (*spvDescriptorSet0.fp_c15)._m0[21].w * (*spvDescriptorSet0.fp_c15)._m0[22].y;
    float _967 = _807 * _959;
    float _969 = fma(_891, _957, _597);
    float _971 = (*spvDescriptorSet0.fp_c15)._m0[21].w * (*spvDescriptorSet0.fp_c15)._m0[22].z;
    float _973 = _845 * _963;
    float _975 = fma(_879, _965, _967);
    float _977 = _831 * _969;
    float _979 = _110 * _873;
    float _981 = fma(_881, _971, _973);
    float _983 = fma(_877, _961, _977);
    float _985 = _110 * _901;
    float _987 = _110 * _909;
    float _989 = _110 * _915;
    float _991 = fma(_807, _985, _975);
    float _993 = fma(_845, _987, _981);
    float _995 = fma(_831, _989, _983);
    float _997 = fma(_927, _843, _991);
    bool _999 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1001 = fma(_925, _843, _993);
    float _1003 = fma(_923, _843, _995);
    float _1005 = _623 + _997;
    float _1007 = _110 * _933;
    float _1009 = _625 + _1001;
    float _1011 = _621 + _1003;
    float _1013 = _110 * _939;
    float _1015 = _110 * _949;
    float _1017 = 0.0 + _148;
    float _1019 = precise::clamp(_1017, 0.0, 1.0);
    float _1021 = fma(_1011, _1013, _1007);
    float _1023 = fma(_1005, _1013, _979);
    float _1025 = fma(_1009, _1013, _1015);
    bool _1027 = !_999;
    float _1029 = _1019;
    if (!_1027)
    {
        float _1031 = in.m_63.z;
        float _1033 = gl_FragCoord.w;
        float _1035 = _1031 * _1033;
        float _1037 = _110 * _1035;
        float _1039 = _1037 * _232;
        float _1041 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _1043 = fma(_1039, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1041);
        float _1045 = 1.0 / _1043;
        float _1047 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _1049 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1051 = fma(_1045, _1047, _1049);
        float _1053 = _1051 * 8.0;
        float _1055 = precise::clamp(_1053, 0.0, 1.0);
        float _1057 = _1019 * _1055;
        _1029 = _1057;
    }
    float _1059 = _1029;
    float _1061 = 0.0 + _1059;
    float _1063 = precise::clamp(_1061, 0.0, 1.0);
    out.m_72.x = _1021;
    out.m_72.y = _1023;
    out.m_72.z = _1025;
    out.m_72.w = _1063;
    return out;
}

