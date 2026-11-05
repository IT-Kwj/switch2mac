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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    constant _16* fp_c4 [[id(4)]];
    const device _29* fp_s0 [[id(5)]];
    const device _29* fp_s1 [[id(6)]];
    texture2d<float> fp_t_tcb_1A [[id(7)]];
    sampler fp_t_tcb_1ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_20 [[id(13)]];
    sampler fp_t_tcb_20Smplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_8 [[id(15)]];
    sampler fp_t_tcb_8Smplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_A [[id(17)]];
    sampler fp_t_tcb_ASmplr [[id(18)]];
    texture2d_array<float> fp_t_tcb_C [[id(19)]];
    sampler fp_t_tcb_CSmplr [[id(20)]];
    texture2d_array<float> fp_t_tcb_14 [[id(21)]];
    sampler fp_t_tcb_14Smplr [[id(22)]];
    texturecube_array<float> fp_t_tcb_1C [[id(23)]];
    sampler fp_t_tcb_1CSmplr [[id(24)]];
    texture3d<float> fp_t_tcb_24 [[id(25)]];
    sampler fp_t_tcb_24Smplr [[id(26)]];
    texture2d<float> fp_t_tcb_18 [[id(27)]];
    sampler fp_t_tcb_18Smplr [[id(28)]];
    texture2d<float> fp_t_tcb_12 [[id(29)]];
    sampler fp_t_tcb_12Smplr [[id(30)]];
    texture2d<float> fp_t_tcb_16 [[id(31)]];
    sampler fp_t_tcb_16Smplr [[id(32)]];
    texture2d<float> fp_t_tcb_1E [[id(33)]];
    sampler fp_t_tcb_1ESmplr [[id(34)]];
    sampler fp_t_tcb_1ASmplr_w [[id(35)]];
    sampler fp_t_tcb_ESmplr_w [[id(36)]];
    sampler fp_t_tcb_10Smplr_w [[id(37)]];
    sampler fp_t_tcb_8Smplr_w [[id(38)]];
    sampler fp_t_tcb_ASmplr_w [[id(39)]];
    sampler fp_t_tcb_CSmplr_w [[id(40)]];
    sampler fp_t_tcb_1CSmplr_w [[id(41)]];
    sampler fp_t_tcb_24Smplr_w [[id(42)]];
    sampler fp_t_tcb_18Smplr_w [[id(43)]];
    sampler fp_t_tcb_12Smplr_w [[id(44)]];
    sampler fp_t_tcb_16Smplr_w [[id(45)]];
    sampler fp_t_tcb_1ESmplr_w [[id(46)]];
    constant dm_border_t* dm_border [[id(47)]];
};

struct main0_out
{
    float4 m_103 [[color(0)]];
    float4 m_105 [[color(1)]];
};

struct main0_in
{
    float4 m_82 [[user(locn0)]];
    float4 m_94 [[user(locn1)]];
    float4 m_96 [[user(locn2)]];
    float4 m_98 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_88 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_100 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
};

static inline __attribute__((always_inline))
int _111(thread const int& _7765, const device _29& fp_s1)
{
    uint _7768 = uint(int(uint(_7765) >> uint(2)));
    float _7770 = as_type<float>(fp_s1._m0[int(_7768)]);
    int _7772 = _7765 & 3;
    int _7774 = _7772 << 3;
    int _7776 = as_type<int>(_7770) >> _7774;
    int _7778 = extract_bits(_7776, 0u, 16u);
    return _7778;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _115 = gl_FragCoord.x;
    float _117 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _119 = _115 / _117;
    float _121 = gl_FragCoord.y;
    float _123 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _125 = _121 / _123;
    float _127 = gl_FragCoord.w;
    float _129 = in.m_82.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    int _135 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _137 = _135 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    float _139 = in.m_82.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    int _145 = _137 * 96;
    int _147 = _145 + 80;
    uint _150 = uint(int(uint(_147) >> uint(2)));
    float _152 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_150)]);
    int _154 = _145 + 16;
    int _156 = _145 + 24;
    uint _158 = uint(int(uint(_154) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_158)];
    float _160 = as_type<float>(_dmw1.x);
    int _162 = _154 + 4;
    uint _164 = uint(int(uint(_162) >> uint(2)));
    float _166 = as_type<float>(_dmw1.y);
    uint _168 = uint(int(uint(_156) >> uint(2)));
    float _170 = as_type<float>(_dmw1.z);
    int _172 = _156 + 4;
    uint _174 = uint(int(uint(_172) >> uint(2)));
    float _176 = as_type<float>(_dmw1.w);
    float _178 = _119 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _180 = _125 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _182 = 1.0 / _127;
    float2 _3274 = float2(_178, _180);
    float2 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_3274, float2(0.0), isnan(_3274))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_3274, float2(0.0), isnan(_3274))).xy;
    float _188 = _186.x;
    float _190 = _186.y;
    float _192 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.0625;
    float _194 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.75;
    float _196 = _182 * _133;
    float _198 = _182 * _143;
    float _200 = _196 + _192;
    float _202 = -_192;
    float _204 = fma(_196, 0.75, _202);
    float _206 = _198 + _192;
    float _208 = -_192;
    float _210 = fma(_198, 0.75, _208);
    float _212 = -_194;
    float _214 = fma(_212, (*spvDescriptorSet0.fp_c11)._m0[40].z, _200);
    float _216 = -_194;
    float _218 = fma(_216, (*spvDescriptorSet0.fp_c11)._m0[40].z, _204);
    float2 _3336 = float2(_206, _214);
    float2 _220 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3336, float2(0.0), isnan(_3336))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3336, float2(0.0), isnan(_3336))).xy;
    float _222 = _220.x;
    float _224 = _220.y;
    float2 _3348 = float2(_210, _218);
    float2 _226 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3348, float2(0.0), isnan(_3348))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3348, float2(0.0), isnan(_3348))).xy;
    float _228 = _226.x;
    float _230 = _226.y;
    int _232 = _145 + 8;
    uint _234 = uint(int(uint(_145) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_234)];
    float _236 = as_type<float>(_dmw0.x);
    int _238 = _145 + 4;
    uint _240 = uint(int(uint(_238) >> uint(2)));
    float _242 = as_type<float>(_dmw0.y);
    uint _244 = uint(int(uint(_232) >> uint(2)));
    float _246 = as_type<float>(_dmw0.z);
    int _248 = _232 + 4;
    uint _250 = uint(int(uint(_248) >> uint(2)));
    float _252 = as_type<float>(_dmw0.w);
    float _254 = in.m_84.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_84.w;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    int _266 = _145 + 68;
    float _268 = _182 * _258;
    float _270 = _182 * _264;
    int _272 = as_type<int>(_152) << 6;
    int _274 = _272 + 25912;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    uint _278 = uint(int(uint(int(_276)) >> uint(2)));
    int _280 = int(_276) & 3;
    float _282 = (*spvDescriptorSet0.fp_c9)._m0[int(_278)][_280];
    int _284 = int(_276) + 1;
    uint _286 = uint(int(uint(_284) >> uint(2)));
    int _288 = _284 & 3;
    float _290 = (*spvDescriptorSet0.fp_c9)._m0[int(_286)][_288];
    int _292 = _272 + 25920;
    uint _294 = uint(int(uint(_292) >> uint(2)));
    uint _296 = uint(int(uint(int(_294)) >> uint(2)));
    int _298 = int(_294) & 3;
    float _300 = (*spvDescriptorSet0.fp_c9)._m0[int(_296)][_298];
    int _302 = int(_294) + 1;
    uint _304 = uint(int(uint(_302) >> uint(2)));
    int _306 = _302 & 3;
    float _308 = (*spvDescriptorSet0.fp_c9)._m0[int(_304)][_306];
    int _310 = _272 + 25904;
    uint _312 = uint(int(uint(_310) >> uint(2)));
    uint _314 = uint(int(uint(int(_312)) >> uint(2)));
    int _316 = int(_312) & 3;
    float _318 = (*spvDescriptorSet0.fp_c9)._m0[int(_314)][_316];
    int _320 = int(_312) + 1;
    uint _322 = uint(int(uint(_320) >> uint(2)));
    int _324 = _320 & 3;
    float _326 = (*spvDescriptorSet0.fp_c9)._m0[int(_322)][_324];
    float _328 = fma(_188, 2.0, -1.0);
    float _330 = fma(_190, 2.0, -1.0);
    float _332 = fma(_268, _160, _170);
    float _334 = fma(_270, _166, _176);
    float _336 = fma(_328, (*spvDescriptorSet0.fp_c9)._m0[983].z, _178);
    float _338 = fma(_330, (*spvDescriptorSet0.fp_c9)._m0[983].w, _180);
    uint _340 = uint(int(uint(_266) >> uint(2)));
    float _342 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_340)]);
    float _344 = _332 * _282;
    float _346 = _334 * _290;
    float _348 = _332 * _300;
    float _350 = _334 * _308;
    float _352 = _332 * _318;
    float _354 = _334 * _326;
    float2 _3569 = float2(_336, _338);
    float4 _357 = spvDescriptorSet0.fp_t_tcb_20.gather(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_3569, float2(0.0), isnan(_3569)), int2(0), component::x).xyzw;
    float _359 = _357.x;
    float _361 = _357.y;
    float _363 = _357.z;
    float _365 = _357.w;
    float2 _3586;
    _3586.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_352, _354));
    _3586.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_352, _354));
    float _367 = _3586.x;
    float _369 = _367 * 256.0;
    int _371 = int(_369);
    float2 _3597;
    _3597.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_344, _346));
    _3597.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_344, _346));
    float _373 = _3597.x;
    float _375 = _373 * 256.0;
    int _377 = int(_375);
    float2 _3607;
    _3607.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_348, _350));
    _3607.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_348, _350));
    float _379 = _3607.x;
    float _381 = _379 * 256.0;
    int _383 = int(_381);
    float _385 = in.m_86.y;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = in.m_88.y;
    float _393 = gl_FragCoord.w;
    float _395 = _391 * _393;
    float _397 = in.m_86.x;
    float _399 = gl_FragCoord.w;
    float _401 = _397 * _399;
    float _403 = in.m_86.z;
    float _405 = gl_FragCoord.w;
    float _407 = _403 * _405;
    float _409 = in.m_90.w;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = in.m_88.x;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_92.y;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    float _427 = in.m_88.z;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_92.x;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_92.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = _182 * _389;
    float _447 = _182 * _395;
    float _449 = _182 * _401;
    float _451 = _182 * _407;
    float _453 = _182 * _413;
    float _455 = _182 * _419;
    float _457 = _445 * _445;
    float _459 = _447 * _447;
    float _461 = _182 * _425;
    float _463 = _182 * _431;
    float _465 = fma(_449, _449, _457);
    float _467 = -_453;
    bool _471 = _467 > (*spvDescriptorSet0.fp_c4)._m0[58].x;
    float _473 = float(_471);
    float _475 = fma(_455, _455, _459);
    float _477 = -_453;
    bool _479 = _477 > (*spvDescriptorSet0.fp_c4)._m0[58].y;
    float _481 = float(_479);
    float _483 = _182 * _437;
    float _485 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _487 = _461 + _485;
    float _489 = fma(_451, _451, _465);
    float _491 = fma(_463, _463, _475);
    float _493 = _473 + _481;
    float _495 = _182 * _443;
    float _497 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _499 = _483 + _497;
    float _501 = _487 * _487;
    float _503 = rsqrt(_491);
    float _505 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _507 = _495 + _505;
    float _509 = fma(_499, _499, _501);
    float _511 = rsqrt(_489);
    float _513 = fma(_507, _507, _509);
    float _515 = fma(_268, _236, _246);
    float _517 = precise::min(_493, (*spvDescriptorSet0.fp_c9)._m0[42].w);
    float _519 = fma(_270, _242, _252);
    float _521 = in.m_94.x;
    float _523 = gl_FragCoord.w;
    float _525 = _521 * _523;
    float _527 = in.m_96.x;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = sqrt(_513);
    float _535 = _515 * _318;
    float _537 = in.m_94.w;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_96.y;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_96.z;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_96.w;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = _455 * _503;
    float _563 = _447 * _503;
    float _565 = trunc(_517);
    int _567 = int(_565);
    float _569 = _463 * _503;
    float _571 = _445 * _511;
    float _573 = in.m_98.x;
    float _575 = gl_FragCoord.w;
    float _577 = _573 * _575;
    float _579 = in.m_94.y;
    float _581 = gl_FragCoord.w;
    float _583 = _579 * _581;
    float _585 = in.m_94.z;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = in.m_98.y;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = in.m_88.w;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = spvFAdd(_533, 9.9999997473787516355514526367188e-06);
    float _605 = _449 * _511;
    float _607 = 1.0 / _603;
    int _609 = _567 << 4;
    bool _611 = _609 == 0;
    bool _613 = _609 == 16;
    float _615 = _451 * _511;
    float _617 = _605 * _569;
    bool _619 = _609 == 32;
    float _621 = _182 * _525;
    float _623 = -_617;
    float _625 = fma(_615, _561, _623);
    float _627 = _182 * _531;
    float _629 = _571 * _561;
    float _631 = _182 * _541;
    float _633 = _182 * _547;
    float _635 = _182 * _553;
    float _637 = _182 * _559;
    float _639 = _531;
    float _641 = _631;
    if (_611)
    {
        _639 = _621;
    }
    float _643 = _639;
    float _645 = _499 * _607;
    float _647 = _487 * _607;
    float _649 = _507 * _607;
    float _651 = -_629;
    float _653 = fma(_605, _563, _651);
    float _655 = _643;
    if (_613)
    {
        _655 = _627;
    }
    float _657 = _655;
    float _659 = _182 * _577;
    float _661 = _182 * _583;
    float _663 = _182 * _589;
    float _665 = _577;
    float _667 = _661;
    float _669 = _663;
    float _671 = _657;
    if (_611)
    {
        _665 = _631;
    }
    float _673 = _665;
    float _675 = _182 * _595;
    float _677 = _673;
    if (_613)
    {
        _667 = _633;
    }
    float _679 = _667;
    float _681 = _679;
    if (_613)
    {
        _669 = _635;
    }
    float _683 = _669;
    float _685 = _683;
    if (_613)
    {
        _677 = _637;
    }
    float _687 = _677;
    bool _689 = _224 >= 0.5;
    bool _691 = isnan(_224);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.5);
    bool _697 = _693 || _695;
    float _699 = _615 * _563;
    float _701 = _687;
    if (_619)
    {
        _671 = _659;
    }
    float _703 = _671;
    float _705 = _182 * _601;
    if (_619)
    {
        _681 = _675;
    }
    float _707 = _681;
    float _709 = -_224;
    float _711 = _709 + 1.0;
    bool _713 = _222 >= 0.5;
    bool _715 = isnan(_222);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.5);
    bool _721 = _717 || _719;
    float _723 = -_230;
    float _725 = _723 + 1.0;
    float _727 = -_699;
    float _729 = fma(_571, _569, _727);
    float _731 = _705 * _625;
    float _733 = _224 * _230;
    float _735 = _733 * 2.0;
    float _737 = _711 * _725;
    float _739 = -_222;
    float _741 = _739 + 1.0;
    float _743 = -_228;
    float _745 = _743 + 1.0;
    float _747 = _705 * _729;
    float _749 = _731 * _731;
    float _751 = _735;
    if (_697)
    {
        float _753 = fma(_737, -2.0, 1.0);
        _751 = _753;
    }
    float _755 = _751;
    float _757 = _741 * _745;
    float _759 = _705 * _653;
    float _761 = _222 * _228;
    float _763 = _761 * 2.0;
    float _765 = fma(_747, _747, _749);
    float _767 = _763;
    if (_721)
    {
        float _769 = fma(_757, -2.0, 1.0);
        _767 = _769;
    }
    float _771 = _767;
    float _773 = fma(2.007874011993408203125, _755, -1.007874011993408203125);
    float _775 = fma(_759, _759, _765);
    float _777 = fma(2.007874011993408203125, _771, -1.007874011993408203125);
    float _779 = _773 * _773;
    float _781 = rsqrt(_775);
    float _783 = in.m_98.w;
    float _785 = gl_FragCoord.w;
    float _787 = _783 * _785;
    float _789 = fma(_777, _777, _779);
    float _791 = -_789;
    float _793 = _791 + 1.0;
    float _795 = precise::clamp(_793, 0.0, 1.0);
    float _797 = sqrt(_795);
    float _799 = _781 * _773;
    float _801 = _731 * _799;
    float _803 = _747 * _799;
    float _805 = fma(_563, _777, _801);
    float _807 = fma(_561, _777, _803);
    float _809 = _759 * _799;
    float _811 = fma(_571, _797, _805);
    float _813 = fma(_569, _777, _809);
    float _815 = fma(_605, _797, _807);
    float _817 = _811 * _811;
    float _819 = in.m_98.z;
    float _821 = gl_FragCoord.w;
    float _823 = _819 * _821;
    float _825 = _182 * _787;
    float _827 = fma(_338, (*spvDescriptorSet0.fp_c9)._m0[47].y, -0.5);
    float _829 = fma(_336, (*spvDescriptorSet0.fp_c9)._m0[47].x, -0.5);
    float _831 = fma(_815, _815, _817);
    float _833 = floor(_827);
    if (_619)
    {
        _701 = _825;
    }
    float _835 = _701;
    float _837 = floor(_829);
    float _839 = 1.0 / _835;
    float _841 = _182 * _823;
    if (_619)
    {
        _685 = _841;
    }
    float _843 = _685;
    float _845 = -_363;
    float _847 = fma(_845, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _849 = fma(_615, _797, _813);
    float _851 = fma(_849, _849, _831);
    float _853 = 1.0 / _847;
    float _855 = rsqrt(_851);
    float _857 = -_365;
    float _859 = fma(_857, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _861 = -_833;
    float _863 = _827 + _861;
    float _865 = -_837;
    float _867 = _829 + _865;
    float _869 = -_359;
    float _871 = fma(_869, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _873 = -_863;
    float _875 = _873 + 1.0;
    float _877 = 1.0 / _859;
    float _879 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _881 = _853 * _879;
    float _883 = _839 * _707;
    float _885 = _839 * _703;
    float _887 = _867 * _875;
    float _889 = -_361;
    float _891 = fma(_889, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _893 = precise::min(_453, _881);
    float _895 = _811 * _855;
    float _897 = 1.0 / _871;
    float _899 = _815 * _855;
    float _901 = _647 * _895;
    float _903 = _893 * _887;
    float _905 = _849 * _855;
    int _907 = _272 + 25944;
    uint _909 = uint(int(uint(_907) >> uint(2)));
    uint _911 = uint(int(uint(int(_909)) >> uint(2)));
    int _913 = int(_909) & 3;
    float _915 = (*spvDescriptorSet0.fp_c9)._m0[int(_911)][_913];
    float _917 = fma(_645, _899, _901);
    float _919 = 1.0 / _891;
    float _921 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _923 = _877 * _921;
    float _925 = fma(_649, _905, _917);
    float _927 = -_867;
    float _929 = _927 + 1.0;
    float _931 = _839 * _843;
    float _933 = precise::clamp(_931, 0.0, 1.0);
    float _935 = _867 * _863;
    float _937 = _925 + _925;
    float _939 = precise::min(_453, _923);
    float _941 = _929 * _875;
    float _943 = _863 * _929;
    float _945 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _947 = _897 * _945;
    float _949 = -_937;
    float _951 = fma(_895, _949, _647);
    float _953 = -_937;
    float _955 = fma(_899, _953, _645);
    float _957 = fma(_939, _941, _903);
    float _959 = -_649;
    float _961 = fma(_905, _937, _959);
    float _963 = precise::min(_453, _947);
    float _965 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _967 = _919 * _965;
    float _969 = abs(_951);
    float _971 = abs(_955);
    float _973 = precise::max(_969, _971);
    int _975 = _272 + 25936;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    uint _979 = uint(int(uint(int(_977)) >> uint(2)));
    int _981 = int(_977) & 3;
    float _983 = (*spvDescriptorSet0.fp_c9)._m0[int(_979)][_981];
    int _985 = int(_977) + 1;
    uint _987 = uint(int(uint(_985) >> uint(2)));
    int _989 = _985 & 3;
    float _991 = (*spvDescriptorSet0.fp_c9)._m0[int(_987)][_989];
    float _993 = abs(_961);
    float _995 = precise::max(_993, _973);
    float _997 = fma(_963, _943, _957);
    float _999 = precise::min(_453, _967);
    float _1001 = fma(-0.0500000007450580596923828125, _771, 0.02500000037252902984619140625);
    float _1003 = fma(0.0500000007450580596923828125, _755, -0.02500000037252902984619140625);
    float _1005 = 1.0 / _995;
    float _1007 = fma(_999, _935, _997);
    float _1009 = precise::max(_342, _915);
    float _1011 = -_1007;
    float _1013 = _453 + _1011;
    float _1015 = float(uint(_371));
    int _1017 = _272 + 25952;
    uint _1019 = uint(int(uint(_1017) >> uint(2)));
    uint _1021 = uint(int(uint(int(_1019)) >> uint(2)));
    int _1023 = int(_1019) & 3;
    float _1025 = (*spvDescriptorSet0.fp_c9)._m0[int(_1021)][_1023];
    float _1027 = _1013 * 0.5;
    float _1029 = float(uint(_377));
    float _1031 = _1015 * 0.00390625;
    float _1033 = float(uint(_383));
    float _1035 = precise::max(_1027, 0.100000001490116119384765625);
    float _1037 = _1029 * 0.00390625;
    float _1039 = _961 * _1005;
    float _1041 = precise::max(_342, _991);
    float _1043 = precise::min(_1035, 4.0);
    int _1045 = _145 + 64;
    float _1047 = _533 + (-250.0);
    float _1049 = precise::max(_342, _983);
    float _1051 = _1033 * 0.00390625;
    float _1053 = precise::max(_1041, _1037);
    float _1055 = fma(_1003, _1043, _338);
    float _1057 = precise::max(0.0, _1047);
    float _1059 = fma(_1001, _1043, _336);
    float _1061 = _955 * _1005;
    float _1063 = abs(_951);
    float _1065 = _1063 * _1005;
    float _1067 = _1057 * 0.001000000047497451305389404296875;
    float _1069 = precise::clamp(_1067, 0.0, 1.0);
    float _1071 = precise::max(_1009, _1051);
    uint _1073 = uint(int(uint(_1045) >> uint(2)));
    float _1075 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_1073)]);
    float _1077 = precise::max(_1049, _1031);
    float _1079 = fma(_1069, 1.39999997615814208984375, 0.070000000298023223876953125);
    float _1081 = rint(_1025);
    float _1083 = precise::max(_1081, 0.0);
    uint _1085 = uint(_1083);
    uint _1087 = clamp(_1085, 0u, 65535u);
    float2 _4611 = float2(_1059, _1055);
    float4 _1089 = spvDescriptorSet0.fp_t_tcb_20.gather(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_4611, float2(0.0), isnan(_4611)), int2(0), component::x).xyzw;
    float _1091 = _1089.x;
    float _1093 = _1089.y;
    float _1095 = _1089.z;
    float _1097 = _1089.w;
    float _1099 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _1101 = _495 + _1099;
    float _1103 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _1105 = _483 + _1103;
    float _1107 = _1101 * _1101;
    float _1109 = _519 * _326;
    float _1111 = fma(_1105, _1105, _1107);
    float2 _4651;
    _4651.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_535, _1109));
    _4651.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_535, _1109));
    float _1113 = _4651.x;
    float _1115 = _1113 * 256.0;
    int _1117 = int(_1115);
    float _1119 = sqrt(_1111);
    bool _1121 = _1119 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _1123 = rint(_517);
    float _1125 = precise::max(_1123, 0.0);
    uint _1127 = uint(_1125);
    uint _1129 = clamp(_1127, 0u, 65535u);
    float _1131 = _633;
    float _1133 = _933;
    float _1135 = _1065;
    float _1137 = _1039;
    float _1139 = _1007;
    if (_1121)
    {
        float _1141 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _1131 = _1141;
    }
    float _1143 = _1131;
    float _1145 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _1147 = _1119 + _1145;
    float3 _4696 = float3(_885, _883, float(int(_1129)));
    float3 _4700 = select(_4696, float3(0.0), isnan(_4696));
    float _1149 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_14).sample_compare(spvDescriptorSet0.fp_t_tcb_14Smplr, _4700.xy, uint(rint(_4700.z)), _933);
    float4 _4708 = float4(_1061, _1065, _1039, float(1));
    float4 _4712 = select(_4708, float4(0.0), isnan(_4708));
    float3 _1153 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, _4712.xyz, uint(rint(_4712.w)), level(_1079)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, _4712.xyz, uint(rint(_4712.w)), level(_1079)).xyz;
    float _1155 = _1153.x;
    float _1157 = _1153.y;
    float _1159 = _1153.z;
    float3 _4728 = float3(_352, _354, float(int(_1087)));
    float3 _4730 = select(_4728, float3(0.0), isnan(_4728));
    float2 _1161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _4730.xy, uint(rint(_4730.z)), level(_1077)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _4730.xy, uint(rint(_4730.z)), level(_1077)).yz;
    float _1163 = _1161.x;
    float _1165 = _1161.y;
    float3 _4744 = float3(_344, _346, float(int(_1087)));
    float3 _4746 = select(_4744, float3(0.0), isnan(_4744));
    float3 _1167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4746.xy, uint(rint(_4746.z)), level(_1053)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4746.xy, uint(rint(_4746.z)), level(_1053)).xyz;
    float _1169 = _1167.x;
    float _1171 = _1167.y;
    float _1173 = _1167.z;
    float3 _4762 = float3(_348, _350, float(int(_1087)));
    float3 _4764 = select(_4762, float3(0.0), isnan(_4762));
    float3 _1175 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _4764.xy, uint(rint(_4764.z)), level(_1071)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _4764.xy, uint(rint(_4764.z)), level(_1071)).xyz;
    float _1177 = _1175.x;
    float _1179 = _1175.y;
    float _1181 = _1175.z;
    float _1183 = _1147;
    float _1185 = _352;
    float _1187 = _344;
    if (_1121)
    {
        float _1189 = _1147 * _1143;
        _1183 = _1189;
    }
    float _1191 = _1183;
    float _1193 = 0.0;
    if (_1121)
    {
        float _1195 = _1191 * 0.15915493667125701904296875;
        _1193 = _1195;
    }
    float _1197 = _1193;
    float _1199 = _1143;
    if (_1121)
    {
        float _1201 = _1197 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        _1199 = _1203;
    }
    float _1205 = _1199;
    float _1207 = _1191;
    if (_1121)
    {
        float _1209 = _1197 * 6.283185482025146484375;
        float _1211 = sin(_1209);
        _1207 = _1211;
    }
    float _1213 = _1207;
    float _1215 = _1111;
    if (_1121)
    {
        float _1217 = rsqrt(_1111);
        _1215 = _1217;
    }
    float _1219 = _1215;
    if (_1121)
    {
        float _1221 = _461 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _641 = _1221;
    }
    float _1223 = _641;
    if (_1121)
    {
        float _1225 = _1205 + (-1.0);
        _1133 = _1225;
    }
    float _1227 = _1133;
    float _1229 = _1227;
    if (!_1121)
    {
        _1135 = _461;
    }
    float _1231 = _1135;
    float _1233 = _1231;
    if (_1121)
    {
        float _1235 = _1227 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _1229 = _1235;
    }
    float _1237 = _1229;
    float _1239 = _1213;
    if (_1121)
    {
        float _1241 = fma(_1213, _1223, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _1239 = _1241;
    }
    float _1243 = _1239;
    float _1245 = _1243;
    if (_1121)
    {
        float _1247 = fma(_461, _1205, _1237);
        _1233 = _1247;
    }
    float _1249 = _1233;
    if (!_1121)
    {
        _1185 = _483;
    }
    float _1251 = _1185;
    float _1253 = _1251;
    if (_1121)
    {
        float _1255 = _1219 * _1243;
        _1187 = _1255;
    }
    float _1257 = _1187;
    float _1259 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _1261 = _1249 + _1259;
    if (_1121)
    {
        float _1263 = fma(_1105, _1257, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _1253 = _1263;
    }
    float _1265 = _1253;
    if (!_1121)
    {
        _1137 = _495;
    }
    float _1267 = _1137;
    float _1269 = _1267;
    if (_1121)
    {
        float _1271 = fma(_1101, _1257, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _1269 = _1271;
    }
    float _1273 = _1269;
    float _1275 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _1277 = _1265 + _1275;
    float _1279 = _1261 * _1261;
    float _1281 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _1283 = _1273 + _1281;
    float _1285 = fma(_1277, _1277, _1279);
    float _1287 = fma(_1283, _1283, _1285);
    float _1289 = rsqrt(_1287);
    float _1291 = _1289 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _1293 = _1277 * _1291;
    float _1295 = _1283 * _1291;
    float _1297 = _1293 * _1293;
    float _1299 = _1295 * _1295;
    float _1301 = _1297 + _1299;
    float _1303 = sqrt(_1301);
    float _1305 = in.m_86.w;
    float _1307 = gl_FragCoord.w;
    float _1309 = _1305 * _1307;
    bool _1311 = _1303 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _1313 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _1315 = _1303 + _1313;
    float _1317 = as_type<float>(_1129);
    float _1319 = _1315;
    float _1321 = _1291;
    float _1323 = _1293;
    float _1325 = _1295;
    float _1327 = _1299;
    if (_1311)
    {
        float _1329 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _1317 = _1329;
    }
    float _1331 = _1317;
    if (_1311)
    {
        float _1333 = _1315 * _1331;
        _1319 = _1333;
    }
    float _1335 = _1319;
    if (_1311)
    {
        float _1337 = _1335 * 0.15915493667125701904296875;
        _1245 = _1337;
    }
    float _1339 = _1245;
    float _1341 = _182 * _1309;
    float _1343 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _1345 = _1101;
    if (_1311)
    {
        float _1347 = _1339 * 6.283185482025146484375;
        float _1349 = sin(_1347);
        _1345 = _1349;
    }
    float _1351 = _1345;
    float _1353 = 0.0 + _1341;
    float _1355 = precise::clamp(_1353, 0.0, 1.0);
    float _1357 = precise::max(0.0, _1343);
    float _1359 = (*spvDescriptorSet0.fp_c9)._m0[71].z + (-1.0);
    float _1361 = _1237;
    float _1363 = _1357;
    if (_1311)
    {
        float _1365 = _1339 * 6.283185482025146484375;
        float _1367 = cos(_1365);
        _1361 = _1367;
    }
    float _1369 = _1361;
    float _1371 = fma(_1355, _1359, 1.0);
    float _1373 = -_1291;
    float _1375 = -_1357;
    float _1377 = fma(_1261, _1373, _1375);
    float _1379 = _1301;
    if (_1311)
    {
        float _1381 = rsqrt(_1301);
        _1379 = _1381;
    }
    float _1383 = _1379;
    if (_1311)
    {
        float _1385 = _1377 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _1321 = _1385;
    }
    float _1387 = _1321;
    float _1389 = log2(_1371);
    float _1391 = _1387;
    float _1393 = _1351;
    if (_1311)
    {
        float _1395 = fma(_1351, _1387, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _1363 = _1395;
    }
    float _1397 = _1363;
    if (_1311)
    {
        float _1399 = _1369 + (-1.0);
        _1391 = _1399;
    }
    float _1401 = _1391;
    float _1403 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _1405 = _180 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _1407 = _1383;
    float _1409 = _1403;
    float _1411 = _1401;
    if (_1311)
    {
        float _1413 = _1383 * _1397;
        _1407 = _1413;
    }
    float _1415 = _1407;
    if (_1311)
    {
        float _1417 = _1401 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _1393 = _1417;
    }
    float _1419 = _1393;
    float _1421 = precise::min(_1405, _1403);
    if (_1311)
    {
        float _1423 = _1293 * _1415;
        _1323 = _1423;
    }
    float _1425 = _1323;
    if (!_1311)
    {
        _1409 = _1377;
    }
    float _1427 = _1409;
    float _1429 = _1427;
    if (_1311)
    {
        float _1431 = fma(_1377, _1369, _1419);
        _1429 = _1431;
    }
    float _1433 = _1429;
    if (!_1311)
    {
        _1411 = _1297;
    }
    float _1435 = _1411;
    float _1437 = _1389 * 0.693147182464599609375;
    float _1439 = _1435;
    if (_1311)
    {
        float _1441 = _1295 * _1415;
        _1325 = _1441;
    }
    float _1443 = _1325;
    if (_1311)
    {
        float _1445 = _1425 * _1425;
        _1439 = _1445;
    }
    float _1447 = _1439;
    float _1449 = _1437 * (*spvDescriptorSet0.fp_c9)._m0[72].x;
    float _1451 = precise::clamp(_1449, 0.0, 1.0);
    if (_1311)
    {
        float _1453 = _1443 * _1443;
        _1327 = _1453;
    }
    float _1455 = _1327;
    float _1457 = fma(_1433, _1433, _1447);
    float _1459 = _1451 * (*spvDescriptorSet0.fp_c9)._m0[71].z;
    float _1461 = _1457 + _1455;
    float _1463 = precise::min(_1359, _1459);
    float _1465 = rsqrt(_1461);
    float _1467 = _647 + (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1469 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _1471 = floor(_1421);
    float _1473 = _178 * (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _1475 = floor(_1463);
    float _1477 = _645 + (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1479 = _1467 * _1467;
    float _1481 = _1465 * _1425;
    float _1483 = precise::min(_1473, _1469);
    float _1485 = _649 + (*spvDescriptorSet0.fp_c9)._m0[69].z;
    float _1487 = fma(_1477, _1477, _1479);
    float _1489 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _1491 = fma(_533, (*spvDescriptorSet0.fp_c9)._m0[63].x, _1489);
    float _1493 = precise::clamp(_1491, 0.0, 1.0);
    float _1495 = _1465 * _1433;
    float _1497 = _1481 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1499 = fma(_1485, _1485, _1487);
    float _1501 = fma(_1471, (*spvDescriptorSet0.fp_c9)._m0[71].x, _1483);
    float _1503 = -_1493;
    float _1505 = _1503 + 1.0;
    float _1507 = _1465 * _1443;
    float _1509 = _1475 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _1511 = -_1497;
    float _1513 = fma(_1495, (*spvDescriptorSet0.fp_c9)._m0[69].y, _1511);
    float _1515 = -_1093;
    float _1517 = fma(_1515, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _1519 = fma(_1509, (*spvDescriptorSet0.fp_c9)._m0[71].x, _1501);
    float _1521 = rsqrt(_1499);
    float _1523 = -_1091;
    float _1525 = fma(_1523, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _1527 = -_1507;
    float _1529 = fma(_1527, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1513);
    float _1531 = -_1095;
    float _1533 = fma(_1531, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _1535 = abs(_1505);
    float _1537 = log2(_1535);
    float _1539 = fma(_1529, -0.5, 0.5);
    float _1541 = -_1097;
    float _1543 = fma(_1541, (*spvDescriptorSet0.fp_c9)._m0[2645].w, 1.0);
    float _1545 = 1.0 / _1517;
    float _1547 = precise::max(_1075, _983);
    float _1549 = trunc(_1519);
    int _1551 = int(_1549);
    float _1553 = 1.0 / _1525;
    float _1555 = _1477 * _1521;
    float _1557 = _1467 * _1521;
    float _1559 = sqrt(_1539);
    float _1561 = fma(_1529, 0.5, 0.5);
    float _1563 = _1485 * _1521;
    float _1565 = 1.0 / _1533;
    float _1567 = _1537 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _1569 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1571 = _1545 * _1569;
    float _1573 = fma(_1561, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1575 = 1.0 / _1543;
    int _1577 = as_type<int>((*spvDescriptorSet0.fp_c9)._m0[71].w) * as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x);
    int _1579 = _1577 + _1551;
    float _1581 = fma(_1561, _1573, -0.212114393711090087890625);
    float _1583 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _1585 = _453 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _1587 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1589 = _1553 * _1587;
    float _1591 = gl_FragCoord.x;
    float _1593 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _1595 = _1591 / _1593;
    float _1597 = gl_FragCoord.y;
    float _1599 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _1601 = _1597 / _1599;
    float _1603 = exp2(_1567);
    bool _1605 = _1571 > _453;
    float _1607 = -_1585;
    float _1609 = fma(_1583, _1607, 1.0);
    float _1611 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1613 = _1565 * _1611;
    bool _1615 = _1589 > _453;
    bool _1617 = _1615 || _1605;
    float _1619 = fma(_1561, _1581, 1.570728778839111328125);
    float _1621 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1623 = _1575 * _1621;
    bool _1625 = _1613 > _453;
    bool _1627 = _1625 || _1617;
    float _1629 = _1495 + 1.0;
    int _1631 = _1579 * 136;
    bool _1633 = _1623 > _453;
    bool _1635 = _1633 || _1627;
    float _1637 = -_1495;
    float _1639 = fma(_1603, _1629, _1637);
    float _1641 = log2(_1609);
    float _1643 = _1559 * 0.636619746685028076171875;
    float _1645 = float(uint(_1117));
    int _1647 = _1631 + 4;
    float _1649 = -_1619;
    float _1651 = fma(_1643, _1649, 1.0);
    float _1653 = _1645 * 0.00390625;
    uint _1655 = uint(int(uint(_1631) >> uint(2)));
    packed_uint2 _dmw2 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s1)._m0[int(_1655)];
    float _1657 = as_type<float>(_dmw2.x);
    uint _1659 = uint(int(uint(_1647) >> uint(2)));
    float _1661 = as_type<float>(_dmw2.y);
    float _1663 = precise::max(_1547, _1653);
    float _1665 = _1565;
    float _1667 = _1575;
    if (_1635)
    {
        _1665 = _336;
    }
    float _1669 = _1665;
    float _1671 = _1669;
    if (_1635)
    {
        _1667 = _338;
    }
    float _1673 = _1667;
    float _1675 = _1673;
    if (!_1635)
    {
        float _1677 = fma(_1055, (*spvDescriptorSet0.fp_c9)._m0[47].y, -0.5);
        float _1679 = fma(_1059, (*spvDescriptorSet0.fp_c9)._m0[47].x, -0.5);
        float _1681 = precise::min(_453, _1613);
        float _1683 = floor(_1677);
        float _1685 = precise::min(_453, _1623);
        float _1687 = precise::min(_453, _1589);
        float _1689 = precise::min(_453, _1571);
        float _1691 = floor(_1679);
        float _1693 = -_1683;
        float _1695 = _1677 + _1693;
        float _1697 = -_1695;
        float _1699 = _1697 + 1.0;
        float _1701 = -_1691;
        float _1703 = _1679 + _1701;
        float _1705 = -_1703;
        float _1707 = _1705 + 1.0;
        float _1709 = _1703 * _1699;
        float _1711 = _1707 * _1699;
        float _1713 = _1681 * _1709;
        float _1715 = _1695 * _1707;
        float _1717 = _1703 * _1695;
        float _1719 = fma(_1685, _1711, _1713);
        float _1721 = fma(_1687, _1715, _1719);
        float _1723 = fma(_1689, _1717, _1721);
        _1671 = _1059;
        _1675 = _1055;
        _1139 = _1723;
    }
    float _1725 = _1671;
    float _1727 = _1675;
    float _1729 = _1139;
    float _1731 = _1641 * 0.693147182464599609375;
    float _1733 = _1595 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _1735 = fma(_1639, 0.5, 0.5);
    float _1737 = _1601 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _1739 = fma(_483, 6.2500002968590706586837768554688e-05, 0.5);
    float _1741 = precise::clamp(_1739, 0.0, 1.0);
    float _1743 = fma(_495, 6.2500002968590706586837768554688e-05, 0.5);
    float _1745 = precise::clamp(_1743, 0.0, 1.0);
    float _1747 = _1731 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float _1749 = -(*spvDescriptorSet0.fp_c9)._m0[2645].w;
    float _1751 = spvFAdd(_1749, 1.000010013580322265625);
    float3 _5645 = float3(_1733, _1737, _1747);
    float _1753 = dm_bs(spvDescriptorSet0.fp_t_tcb_24.sample(spvDescriptorSet0.fp_t_tcb_24Smplr, select(_5645, float3(0.0), isnan(_5645))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_24, spvDescriptorSet0.fp_t_tcb_24Smplr_w, select(_5645, float3(0.0), isnan(_5645))).x;
    float2 _5653 = float2(_1651, _1735);
    float3 _1755 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_5653, float2(0.0), isnan(_5653))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_5653, float2(0.0), isnan(_5653))).xyz;
    float _1757 = _1755.x;
    float _1759 = _1755.y;
    float _1761 = _1755.z;
    float2 _5667 = float2(_1741, _1745);
    float4 _1763 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_5667, float2(0.0), isnan(_5667))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_5667, float2(0.0), isnan(_5667))).xyzw;
    float _1765 = _1763.x;
    float _1767 = _1763.y;
    float _1769 = _1763.z;
    float _1771 = _1763.w;
    float2 _5683 = float2(_336, _338);
    float4 _1773 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_5683, float2(0.0), isnan(_5683))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_5683, float2(0.0), isnan(_5683))).xyzw;
    float _1775 = _1773.x;
    float _1777 = _1773.y;
    float _1779 = _1773.z;
    float _1781 = _1773.w;
    float3 _5702 = float3(_535, _1109, float(int(_1087)));
    float3 _5704 = select(_5702, float3(0.0), isnan(_5702));
    float _1783 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _5704.xy, uint(rint(_5704.z)), level(_1663)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _5704.xy, uint(rint(_5704.z)), level(_1663)).x;
    float2 _5711 = float2(_1725, _1727);
    float3 _1785 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_5711, float2(0.0), isnan(_5711))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_5711, float2(0.0), isnan(_5711))).xyz;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = 1.0 / _1751;
    float _1795 = (*spvDescriptorSet0.fp_c9)._m0[915].x * 0.5641896724700927734375;
    float _1797 = precise::clamp(_1795, 0.0, 1.0);
    float _1799 = _1179 * 0.4774648249149322509765625;
    float _1801 = (*spvDescriptorSet0.fp_c9)._m0[914].x * 0.28209483623504638671875;
    float _1803 = precise::clamp(_1801, 0.0, 1.0);
    float _1805 = _1797 * 0.88622701168060302734375;
    float _1807 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c9)._m0[908].x;
    float _1809 = -_1797;
    float _1811 = _1809 + 1.0;
    float _1813 = -_1803;
    float _1815 = _1813 + 1.0;
    float _1817 = _1805 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1819 = _1807 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1821 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c9)._m0[908].y;
    float _1823 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c9)._m0[908].z;
    float _1825 = fma(_1815, (*spvDescriptorSet0.fp_c9)._m0[37].y, _1803);
    float _1827 = _1793 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _1829 = fma(_1819, _1811, _1817);
    float _1831 = _1821 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1833 = _1805 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1835 = _1827 * 0.25;
    float _1837 = _1823 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1839 = _1825 * 0.88622701168060302734375;
    float _1841 = fma(_1831, _1811, _1833);
    float _1843 = _1557 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1845 = _1805 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1847 = 1.0 / _1835;
    float _1849 = fma(_1839, (*spvDescriptorSet0.fp_c9)._m0[911].y, _1841);
    float _1851 = fma(_1555, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1843);
    float _1853 = -_645;
    float _1855 = -_901;
    float _1857 = fma(_1853, _899, _1855);
    float _1859 = fma(_1837, _1811, _1845);
    float _1861 = _1849 * 0.18672408163547515869140625;
    float _1863 = -_453;
    float _1865 = fma(_1827, -0.75, _1863);
    float _1867 = -_649;
    float _1869 = fma(_1867, _905, _1857);
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = fma(_1563, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1851);
    float _1875 = precise::clamp(_1873, 0.0, 1.0);
    float _1877 = _647 * _895;
    float _1879 = fma(_1839, (*spvDescriptorSet0.fp_c9)._m0[911].x, _1829);
    float _1881 = _1871 * (-9.27999973297119140625);
    float _1883 = -_1875;
    float _1885 = _1883 + 1.0;
    float _1887 = fma(_645, _899, _1877);
    float _1889 = fma(_1839, (*spvDescriptorSet0.fp_c9)._m0[911].z, _1859);
    float _1891 = _1865 * _1847;
    float _1893 = precise::clamp(_1891, 0.0, 1.0);
    float _1895 = exp2(_1881);
    float _1897 = _1885 * _1885;
    float _1899 = _1555 * _899;
    float _1901 = fma(_1879, 0.095146648585796356201171875, _1861);
    float _1903 = fma(_1069, 0.20000000298023223876953125, 0.00999999977648258209228515625);
    float _1905 = fma(_1069, -0.20000000298023223876953125, 0.9900000095367431640625);
    float _1907 = fma(_649, _905, _1887);
    float _1909 = _1897 * _1897;
    float _1911 = -_1557;
    float _1913 = -_1899;
    float _1915 = fma(_1911, _895, _1913);
    float _1917 = fma(_1889, 0.0364394821226596832275390625, _1901);
    float _1919 = _1907 * _1907;
    float _1921 = _1885 * _1909;
    float _1923 = _1905 * _1905;
    float _1925 = fma(_1919, 0.565323054790496826171875, 0.434676945209503173828125);
    float _1927 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1929 = _1927 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1931 = precise::min(_1923, _1895);
    float _1933 = fma(_1903, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1935 = sqrt(_1925);
    float _1937 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _1939 = _1937 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _1941 = fma(_1905, _1931, _1933);
    float _1943 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _1945 = _1943 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _1947 = fma(_895, 0.5, 0.5);
    float _1949 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _1951 = _1949 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _1953 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _1955 = _1953 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    bool _1957 = _1925 >= 0.0;
    bool _1959 = isnan(_1925);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan(0.0);
    bool _1965 = _1961 || _1963;
    float _1967 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1969 = _1967 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1971 = fma(_1947, _1945, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _1973 = fma(_1947, _1951, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _1975 = fma(_1947, _1939, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _1977 = fma(_1907, 0.75187969207763671875, _1935);
    float _1979 = _647 * 0.75187969207763671875;
    float _1981 = fma(_1947, _1929, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1983 = fma(_1947, _1955, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1985 = _645 * 0.75187969207763671875;
    float _1987 = fma(_1947, _1969, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1989 = _649 * 0.75187969207763671875;
    float _1991 = -_1979;
    float _1993 = fma(_895, _1977, _1991);
    float _1995 = fma(_1903, 0.5, 0.5);
    float _1997 = _899 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1999 = -_1985;
    float _2001 = fma(_899, _1977, _1999);
    float _2003 = -_1989;
    float _2005 = fma(_905, _1977, _2003);
    float _2007 = _1995 * _1995;
    float _2009 = _2007 * 0.5;
    float _2011 = -_895;
    float _2013 = -_1997;
    float _2015 = fma(_2011, (*spvDescriptorSet0.fp_c9)._m0[69].y, _2013);
    float _2017 = _1965 ? _1993 : (-0.0);
    float _2019 = -_1563;
    float _2021 = fma(_2019, _905, _1915);
    float _2023 = precise::clamp(_2021, 0.0, 1.0);
    float _2025 = _1965 ? _2001 : (-0.0);
    float _2027 = -_2009;
    float _2029 = _2027 + 1.0;
    float _2031 = -_905;
    float _2033 = fma(_2031, (*spvDescriptorSet0.fp_c9)._m0[69].z, _2015);
    float _2035 = precise::clamp(_2033, 0.0, 1.0);
    float _2037 = _2017 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _2039 = fma(_1903, _1903, 0.00999999977648258209228515625);
    float _2041 = precise::clamp(_2039, 0.0, 1.0);
    float _2043 = fma(_1871, _2029, _2009);
    float _2045 = fma(_2035, _2029, _2009);
    float _2047 = fma(_2025, (*spvDescriptorSet0.fp_c9)._m0[69].x, _2037);
    float _2049 = _2041 * _2041;
    float _2051 = _2023 * _2023;
    float _2053 = _2043 * _2045;
    float _2055 = _1983 * 0.715200006961822509765625;
    float _2057 = _1965 ? _2005 : (-0.0);
    float _2059 = _1171 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _2061 = fma(_1981, 0.2125999927520751953125, _2055);
    float _2063 = _2049 + (-1.0);
    float _2065 = fma(_2057, (*spvDescriptorSet0.fp_c9)._m0[69].z, _2047);
    float _2067 = fma(_1987, 0.072200000286102294921875, _2061);
    float _2069 = fma(_2051, _2063, 1.0);
    float _2071 = fma(_1903, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _2073 = 1.0 / _2053;
    float _2075 = fma(_1903, -0.572000026702880859375, 1.03999996185302734375);
    float _2077 = _2069 * _2069;
    float _2079 = fma((*spvDescriptorSet0.fp_c11)._m0[15].w, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _2081 = (*spvDescriptorSet0.fp_c11)._m0[15].w * 2.0;
    float _2083 = -(*spvDescriptorSet0.fp_c11)._m0[15].w;
    float _2085 = fma(_2083, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _2087 = _1169 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _2089 = 1.0 / _2067;
    float _2091 = -_2081;
    float _2093 = fma(_2065, _2091, _2079);
    float _2095 = fma(_1941, -1.03999996185302734375, _2075);
    float _2097 = precise::clamp(_2095, 0.0, 1.0);
    float _2099 = fma(_1941, 1.03999996185302734375, _2071);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _2049 * 0.31830990314483642578125;
    float _2105 = in.m_90.y;
    float _2107 = gl_FragCoord.w;
    float _2109 = _2105 * _2107;
    float _2111 = _1971 * 0.31830990314483642578125;
    float _2113 = _1181 * 0.4774648249149322509765625;
    float _2115 = 1.0 / _2077;
    float _2117 = _1173 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _2119 = _1975 * 0.31830990314483642578125;
    float _2121 = precise::max(_2087, _2111);
    bool _2123 = as_type<uint>(_1657) > 0u;
    float _2125 = precise::max(_2117, _2119);
    float _2127 = abs(_2093);
    float _2129 = log2(_2127);
    float _2131 = _2089 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    float _2135 = _2103 * _2115;
    float _2137 = _2035 * _2135;
    float _2139 = fma(_2133, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _2141 = _2129 * 1.5;
    float _2143 = in.m_90.z;
    float _2145 = gl_FragCoord.w;
    float _2147 = _2143 * _2145;
    float _2149 = _2139 * 0.31830990314483642578125;
    float _2151 = exp2(_2141);
    float _2153 = in.m_90.x;
    float _2155 = gl_FragCoord.w;
    float _2157 = _2153 * _2155;
    float _2159 = _1981 * _2149;
    float _2161 = _1983 * _2149;
    float _2163 = _1987 * _2149;
    float _2165 = _2137 * _2073;
    float _2167 = _2165 * 0.25;
    float _2169 = _1177 * 0.4774648249149322509765625;
    float _2171 = _1163 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _2173 = precise::clamp(_2171, 0.0, 1.0);
    float _2175 = _1165 * 0.2820948064327239990234375;
    float _2177 = _2169 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _2179 = fma(_1921, 0.979940712451934814453125, 0.02005931176245212554931640625);
    float _2181 = fma(_2173, _2087, _2177);
    float _2183 = _2151 * 12.56637096405029296875;
    float _2185 = _2175 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _2187 = _2179 * _2167;
    float _2189 = _1973 * 0.31830990314483642578125;
    float _2191 = 1.0 / _2183;
    float _2193 = _1799 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _2195 = precise::max(_1917, 0.00999999977648258209228515625);
    float _2197 = _2185 + _2181;
    float _2199 = precise::max(_2059, _2189);
    float _2201 = fma(_2173, _2059, _2193);
    float _2203 = _2175 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _2205 = precise::max(_2177, _2159);
    float _2207 = _2177 + _2185;
    float _2209 = _2175 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _2211 = _2203 + _2201;
    float _2213 = _182 * _2157;
    float _2215 = _2211 * 0.586610972881317138671875;
    float _2217 = _2085 * _2191;
    float _2219 = _182 * _2109;
    float _2221 = _182 * _2147;
    float _2223 = fma(_2197, 0.298911988735198974609375, _2215);
    float _2225 = _2219 * 0.18672408163547515869140625;
    float _2227 = fma(_2213, 0.095146648585796356201171875, _2225);
    float _2229 = fma(_2221, 0.0364394821226596832275390625, _2227);
    float _2231 = _2113 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _2233 = 1.0 / _2195;
    float _2235 = precise::max(_2229, 0.00999999977648258209228515625);
    float _2237 = fma(_2173, _2117, _2231);
    float _2239 = precise::max(_2193, _2161);
    float _2241 = _2193 + _2203;
    float _2243 = precise::max(_2231, _2163);
    float _2245 = _2209 + _2237;
    float _2247 = 1.0 / _2235;
    float _2249 = _2241 * 0.586610972881317138671875;
    float _2251 = fma(_2245, 0.114477999508380889892578125, _2223);
    float _2253 = _453 + (-20.0);
    float _2255 = fma(_2207, 0.298911988735198974609375, _2249);
    float _2257 = _2231 + _2209;
    float _2259 = fma(_2173, _2125, _2243);
    float _2261 = _2251 * _2233;
    float _2263 = fma(_2257, 0.114477999508380889892578125, _2255);
    float _2265 = -_1729;
    float _2267 = _2253 + _2265;
    float _2269 = precise::min(_2261, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _2271 = -(*spvDescriptorSet0.fp_c9)._m0[1001].w;
    float _2273 = fma(_533, (*spvDescriptorSet0.fp_c9)._m0[1000].w, _2271);
    float _2275 = precise::clamp(_2273, 0.0, 1.0);
    float _2277 = -_1149;
    float _2279 = _2277 + 1.0;
    float _2281 = _2263 * _2247;
    float _2283 = -_453;
    float _2285 = -(*spvDescriptorSet0.fp_c9)._m0[41].x;
    float _2287 = _2283 + _2285;
    float _2289 = _2269 * _1155;
    float _2291 = _2269 * _1157;
    float _2293 = _2269 * _1159;
    float _2295 = precise::min(_2281, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _2297 = _2287 * (*spvDescriptorSet0.fp_c9)._m0[41].y;
    float _2299 = precise::clamp(_2297, 0.0, 1.0);
    float _2301 = fma(_1893, _2267, _1729);
    float _2303 = fma(_2173, _2121, _2205);
    float _2305 = fma(_2173, _2199, _2239);
    float _2307 = _2295 * 0.31830990314483642578125;
    float _2309 = fma(_2299, _2279, _1149);
    float _2311 = -_2301;
    float _2313 = _453 + _2311;
    float _2315 = -_2291;
    float _2317 = fma(_2219, _2307, _2315);
    float _2319 = -_2289;
    float _2321 = fma(_2213, _2307, _2319);
    float _2323 = -_2293;
    float _2325 = fma(_2221, _2307, _2323);
    float _2327 = fma(_2275, _2317, _2291);
    float _2329 = fma(_2275, _2321, _2289);
    float _2331 = fma(_2275, _2325, _2293);
    bool _2333 = !_2123;
    float _2335 = 0.0;
    float _2337 = 0.0;
    float _2339 = 0.0;
    float _2341 = 0.0;
    float _2343 = 0.0;
    float _2345 = 0.0;
    float _2347 = 0.0;
    float _2349 = 0.0;
    float _2351 = 0.0;
    float _2353 = 0.0;
    float _2355 = 0.0;
    float _2357 = 0.0;
    if (!_2333)
    {
        int _2359 = 0;
        bool _2361;
        do
        {
            int _2363 = _2359;
            float _2365 = _2335;
            float _2367 = _2337;
            float _2369 = _2339;
            float _2371 = _2341;
            float _2373 = _2343;
            float _2375 = _2345;
            int _2377 = _2363 << 1;
            int _2379 = _2377 + _1631;
            int _2381 = _2379 + 8;
            int _2383 = _2381;
            int _2385 = _111(_2383, (*spvDescriptorSet0.fp_s1));
            int _2387 = _2363 + 1;
            bool _2389 = uint(_2387) >= as_type<uint>(_1657);
            int _2391 = _2385 & 65535;
            int _2393 = _2391 * 48;
            int _2395 = _2393 + 1168;
            uint _2397 = uint(int(uint(_2395) >> uint(2)));
            uint _2399 = uint(int(uint(int(_2397)) >> uint(2)));
            int _2401 = int(_2397) & 3;
            float _2403 = (*spvDescriptorSet0.fp_c9)._m0[int(_2399)][_2401];
            int _2405 = int(_2397) + 1;
            uint _2407 = uint(int(uint(_2405) >> uint(2)));
            int _2409 = _2405 & 3;
            float _2411 = (*spvDescriptorSet0.fp_c9)._m0[int(_2407)][_2409];
            int _2413 = _2393 + 1176;
            uint _2415 = uint(int(uint(_2413) >> uint(2)));
            uint _2417 = uint(int(uint(int(_2415)) >> uint(2)));
            int _2419 = int(_2415) & 3;
            float _2421 = (*spvDescriptorSet0.fp_c9)._m0[int(_2417)][_2419];
            int _2423 = int(_2415) + 1;
            uint _2425 = uint(int(uint(_2423) >> uint(2)));
            int _2427 = _2423 & 3;
            float _2429 = (*spvDescriptorSet0.fp_c9)._m0[int(_2425)][_2427];
            float _2431 = -_461;
            float _2433 = _2431 + _2411;
            float _2435 = -_483;
            float _2437 = _2435 + _2403;
            float _2439 = _2433 * _2433;
            float _2441 = -_495;
            float _2443 = _2441 + _2421;
            float _2445 = fma(_2437, _2437, _2439);
            float _2447 = fma(_2443, _2443, _2445);
            int _2449 = _2393 + 1200;
            uint _2451 = uint(int(uint(_2449) >> uint(2)));
            uint _2453 = uint(int(uint(int(_2451)) >> uint(2)));
            int _2455 = int(_2451) & 3;
            float _2457 = (*spvDescriptorSet0.fp_c9)._m0[int(_2453)][_2455];
            float _2459 = rsqrt(_2447);
            float _2461 = sqrt(_2447);
            float _2463 = _2433 * _2459;
            float _2465 = _2437 * _2459;
            float _2467 = _2443 * _2459;
            int _2469 = _2393 + 1192;
            uint _2471 = uint(int(uint(_2469) >> uint(2)));
            uint _2473 = uint(int(uint(int(_2471)) >> uint(2)));
            int _2475 = int(_2471) & 3;
            float _2477 = (*spvDescriptorSet0.fp_c9)._m0[int(_2473)][_2475];
            int _2479 = int(_2471) + 1;
            uint _2481 = uint(int(uint(_2479) >> uint(2)));
            int _2483 = _2479 & 3;
            float _2485 = (*spvDescriptorSet0.fp_c9)._m0[int(_2481)][_2483];
            float _2487 = -_647;
            float _2489 = _2487 + _2463;
            float _2491 = -_645;
            float _2493 = _2491 + _2465;
            float _2495 = -_2461;
            float _2497 = _2495 + _2429;
            float _2499 = _2489 * _2489;
            float _2501 = -_649;
            float _2503 = _2501 + _2467;
            float _2505 = fma(_2493, _2493, _2499);
            float _2507 = fma(_2503, _2503, _2505);
            float _2509 = rsqrt(_2507);
            float _2511 = _2497 * _2457;
            float _2513 = precise::clamp(_2511, 0.0, 1.0);
            int _2515 = _2393 + 1184;
            uint _2517 = uint(int(uint(_2515) >> uint(2)));
            uint _2519 = uint(int(uint(int(_2517)) >> uint(2)));
            int _2521 = int(_2517) & 3;
            float _2523 = (*spvDescriptorSet0.fp_c9)._m0[int(_2519)][_2521];
            int _2525 = int(_2517) + 1;
            uint _2527 = uint(int(uint(_2525) >> uint(2)));
            int _2529 = _2525 & 3;
            float _2531 = (*spvDescriptorSet0.fp_c9)._m0[int(_2527)][_2529];
            float _2533 = abs(_2513);
            float _2535 = log2(_2533);
            float _2537 = _2489 * _2509;
            float _2539 = _2493 * _2509;
            float _2541 = _2503 * _2509;
            float _2543 = _895 * _2537;
            float _2545 = fma(_899, _2539, _2543);
            float _2547 = fma(_905, _2541, _2545);
            float _2549 = precise::clamp(_2547, 0.0, 1.0);
            float _2551 = _2535 * _2485;
            float _2553 = _895 * _2463;
            float _2555 = _2549 * _2549;
            float _2557 = fma(_899, _2465, _2553);
            float _2559 = exp2(_2551);
            float _2561 = fma(_2063, _2555, 1.0);
            float _2563 = fma(_905, _2467, _2557);
            float _2565 = precise::clamp(_2563, 0.0, 1.0);
            float _2567 = _2561 * _2561;
            float _2569 = 1.0 / _2567;
            float _2571 = _2565 * _2559;
            float _2573 = fma(_2571, _2477, _2365);
            float _2575 = fma(_2571, _2523, _2367);
            float _2577 = fma(_2571, _2531, _2369);
            float _2579 = _2049 * _2569;
            float _2581 = _2579 * _2571;
            float _2583 = fma(_2581, _2523, _2371);
            float _2585 = fma(_2581, _2531, _2373);
            float _2587 = fma(_2581, _2477, _2375);
            _2361 = !_2389;
            _2359 = _2387;
            _2335 = _2573;
            _2337 = _2575;
            _2339 = _2577;
            _2341 = _2583;
            _2343 = _2585;
            _2345 = _2587;
            _2347 = _2583;
            _2349 = _2573;
            _2351 = _2575;
            _2353 = _2577;
            _2355 = _2585;
            _2357 = _2587;
        } while (_2361);
    }
    float _2589 = _2347;
    float _2591 = _2349;
    float _2593 = _2351;
    float _2595 = _2353;
    float _2597 = _2355;
    float _2599 = _2357;
    bool _2601 = as_type<uint>(_1661) > 0u;
    float _2603 = _2209 + _2259;
    float _2605 = _2185 + _2303;
    float _2607 = _2203 + _2305;
    bool _2609 = !_2601;
    float _2611 = _2591;
    float _2613 = _2593;
    float _2615 = _2595;
    float _2617 = _2589;
    float _2619 = _2597;
    float _2621 = _2599;
    float _2623 = _2593;
    float _2625 = _2595;
    float _2627 = _2591;
    float _2629 = _2589;
    float _2631 = _2597;
    float _2633 = _2599;
    if (!_2609)
    {
        int _2635 = 0;
        bool _2637;
        do
        {
            int _2639 = _2635;
            float _2641 = _2611;
            float _2643 = _2613;
            float _2645 = _2615;
            float _2647 = _2617;
            float _2649 = _2619;
            float _2651 = _2621;
            int _2653 = _2639 << 1;
            int _2655 = _2653 + _1631;
            int _2657 = _2655 + 72;
            int _2659 = _2657;
            int _2661 = _111(_2659, (*spvDescriptorSet0.fp_s1));
            int _2663 = _2639 + 1;
            bool _2665 = uint(_2663) >= as_type<uint>(_1661);
            int _2667 = _2661 << 6;
            int _2669 = 4194240 & _2667;
            int _2671 = _2669 + 10384;
            uint _2673 = uint(int(uint(_2671) >> uint(2)));
            uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
            int _2677 = int(_2673) & 3;
            float _2679 = (*spvDescriptorSet0.fp_c9)._m0[int(_2675)][_2677];
            int _2681 = int(_2673) + 1;
            uint _2683 = uint(int(uint(_2681) >> uint(2)));
            int _2685 = _2681 & 3;
            float _2687 = (*spvDescriptorSet0.fp_c9)._m0[int(_2683)][_2685];
            int _2689 = _2669 + 10392;
            uint _2691 = uint(int(uint(_2689) >> uint(2)));
            uint _2693 = uint(int(uint(int(_2691)) >> uint(2)));
            int _2695 = int(_2691) & 3;
            float _2697 = (*spvDescriptorSet0.fp_c9)._m0[int(_2693)][_2695];
            int _2699 = int(_2691) + 1;
            uint _2701 = uint(int(uint(_2699) >> uint(2)));
            int _2703 = _2699 & 3;
            float _2705 = (*spvDescriptorSet0.fp_c9)._m0[int(_2701)][_2703];
            int _2707 = _2669 + 10436;
            uint _2709 = uint(int(uint(_2707) >> uint(2)));
            uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
            int _2713 = int(_2709) & 3;
            float _2715 = (*spvDescriptorSet0.fp_c9)._m0[int(_2711)][_2713];
            int _2717 = _2669 + 10444;
            uint _2719 = uint(int(uint(_2717) >> uint(2)));
            uint _2721 = uint(int(uint(int(_2719)) >> uint(2)));
            int _2723 = int(_2719) & 3;
            float _2725 = (*spvDescriptorSet0.fp_c9)._m0[int(_2721)][_2723];
            float _2727 = -_461;
            float _2729 = _2727 + _2687;
            float _2731 = -_483;
            float _2733 = _2731 + _2679;
            float _2735 = _2729 * _2729;
            float _2737 = -_495;
            float _2739 = _2737 + _2697;
            float _2741 = fma(_2733, _2733, _2735);
            float _2743 = fma(_2739, _2739, _2741);
            float _2745 = rsqrt(_2743);
            float _2747 = _2729 * _2745;
            float _2749 = _2733 * _2745;
            float _2751 = _2739 * _2745;
            float _2753 = -_647;
            float _2755 = _2753 + _2747;
            float _2757 = -_645;
            float _2759 = _2757 + _2749;
            float _2761 = sqrt(_2743);
            float _2763 = -_649;
            float _2765 = _2763 + _2751;
            float _2767 = _2755 * _2755;
            float _2769 = fma(_2759, _2759, _2767);
            int _2771 = _2669 + 10400;
            uint _2773 = uint(int(uint(_2771) >> uint(2)));
            uint _2775 = uint(int(uint(int(_2773)) >> uint(2)));
            int _2777 = int(_2773) & 3;
            float _2779 = (*spvDescriptorSet0.fp_c9)._m0[int(_2775)][_2777];
            int _2781 = int(_2773) + 1;
            uint _2783 = uint(int(uint(_2781) >> uint(2)));
            int _2785 = _2781 & 3;
            float _2787 = (*spvDescriptorSet0.fp_c9)._m0[int(_2783)][_2785];
            float _2789 = fma(_2765, _2765, _2769);
            int _2791 = _2669 + 10424;
            uint _2793 = uint(int(uint(_2791) >> uint(2)));
            uint _2795 = uint(int(uint(int(_2793)) >> uint(2)));
            int _2797 = int(_2793) & 3;
            float _2799 = (*spvDescriptorSet0.fp_c9)._m0[int(_2795)][_2797];
            int _2801 = int(_2793) + 1;
            uint _2803 = uint(int(uint(_2801) >> uint(2)));
            int _2805 = _2801 & 3;
            float _2807 = (*spvDescriptorSet0.fp_c9)._m0[int(_2803)][_2805];
            float _2809 = rsqrt(_2789);
            float _2811 = -_2761;
            float _2813 = _2811 + _2705;
            float _2815 = _2813 * _2715;
            float _2817 = precise::clamp(_2815, 0.0, 1.0);
            int _2819 = _2669 + 10408;
            uint _2821 = uint(int(uint(_2819) >> uint(2)));
            uint _2823 = uint(int(uint(int(_2821)) >> uint(2)));
            int _2825 = int(_2821) & 3;
            float _2827 = (*spvDescriptorSet0.fp_c9)._m0[int(_2823)][_2825];
            int _2829 = int(_2821) + 1;
            uint _2831 = uint(int(uint(_2829) >> uint(2)));
            int _2833 = _2829 & 3;
            float _2835 = (*spvDescriptorSet0.fp_c9)._m0[int(_2831)][_2833];
            float _2837 = abs(_2817);
            float _2839 = log2(_2837);
            float _2841 = _2755 * _2809;
            float _2843 = _2759 * _2809;
            float _2845 = _2765 * _2809;
            float _2847 = _895 * _2841;
            float _2849 = fma(_899, _2843, _2847);
            int _2851 = _2669 + 10416;
            uint _2853 = uint(int(uint(_2851) >> uint(2)));
            uint _2855 = uint(int(uint(int(_2853)) >> uint(2)));
            int _2857 = int(_2853) & 3;
            float _2859 = (*spvDescriptorSet0.fp_c9)._m0[int(_2855)][_2857];
            int _2861 = int(_2853) + 1;
            uint _2863 = uint(int(uint(_2861) >> uint(2)));
            int _2865 = _2861 & 3;
            float _2867 = (*spvDescriptorSet0.fp_c9)._m0[int(_2863)][_2865];
            float _2869 = fma(_905, _2845, _2849);
            float _2871 = precise::clamp(_2869, 0.0, 1.0);
            float _2873 = _2871 * _2871;
            float _2875 = fma(_2063, _2873, 1.0);
            float _2877 = _2749 * _2779;
            float _2879 = _2875 * _2875;
            float _2881 = -_2747;
            float _2883 = -_2877;
            float _2885 = fma(_2881, _2787, _2883);
            float _2887 = _895 * _2747;
            float _2889 = _2839 * _2807;
            float _2891 = fma(_899, _2749, _2887);
            float _2893 = 1.0 / _2879;
            float _2895 = fma(_905, _2751, _2891);
            float _2897 = precise::clamp(_2895, 0.0, 1.0);
            float _2899 = -_2751;
            float _2901 = fma(_2899, _2827, _2885);
            float _2903 = exp2(_2889);
            float _2905 = -_2835;
            float _2907 = _2901 + _2905;
            float _2909 = _2907 * _2725;
            float _2911 = precise::clamp(_2909, 0.0, 1.0);
            float _2913 = _2903 * _2911;
            float _2915 = _2049 * _2893;
            float _2917 = _2897 * _2913;
            float _2919 = _2915 * _2917;
            float _2921 = fma(_2917, _2799, _2641);
            float _2923 = fma(_2917, _2859, _2643);
            float _2925 = fma(_2917, _2867, _2645);
            float _2927 = fma(_2919, _2859, _2647);
            float _2929 = fma(_2919, _2867, _2649);
            float _2931 = fma(_2919, _2799, _2651);
            _2637 = !_2665;
            _2635 = _2663;
            _2611 = _2921;
            _2613 = _2923;
            _2615 = _2925;
            _2617 = _2927;
            _2619 = _2929;
            _2621 = _2931;
            _2623 = _2923;
            _2625 = _2925;
            _2627 = _2921;
            _2629 = _2927;
            _2631 = _2929;
            _2633 = _2931;
        } while (_2637);
    }
    float _2933 = _2623;
    float _2935 = _2625;
    float _2937 = _2627;
    float _2939 = _2629;
    float _2941 = _2631;
    float _2943 = _2633;
    float _2945 = _1871 + 1.0;
    float _2947 = fma(_2097, 0.02005931176245212554931640625, _2101);
    float _2949 = fma(_2605, 3.1415927410125732421875, _2933);
    float _2951 = -_2101;
    float _2953 = _2951 + 1.0;
    float _2955 = _2313 * _2945;
    float _2957 = _1771 + (*spvDescriptorSet0.fp_c11)._m0[15].x;
    float _2959 = fma(_2607, 3.1415927410125732421875, _2935);
    float _2961 = _1783 * _2309;
    float _2963 = _2955 * (-1.44269502162933349609375);
    float _2965 = _1771 + (*spvDescriptorSet0.fp_c11)._m0[15].y;
    float _2967 = _1771 + (*spvDescriptorSet0.fp_c11)._m0[15].z;
    float _2969 = _2949 * _2953;
    float _2971 = 1.0 / _2957;
    float _2973 = _2957 * _2963;
    float _2975 = _2959 * _2953;
    float _2977 = _2965 * _2963;
    float _2979 = _2967 * _2963;
    float _2981 = _2961 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _2983 = _1765 * _2969;
    float _2985 = _1767 * _2975;
    float _2987 = 1.0 / _2967;
    float _2989 = _2961 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _2991 = _1765 * _2981;
    float _2993 = fma(_2603, 3.1415927410125732421875, _2937);
    float _2995 = _1537 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _2997 = _1767 * _2989;
    float _2999 = _2961 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _3001 = gl_FragCoord.w;
    float _3003 = _2993 * _2953;
    float _3005 = _2983 * 0.079577468335628509521484375;
    float _3007 = exp2(_2973);
    float _3009 = _2329 + _2939;
    float _3011 = _1769 * _3003;
    float _3013 = fma(_2217, _2991, _3005);
    float _3015 = _1769 * _2999;
    float _3017 = _2985 * 0.079577468335628509521484375;
    float _3019 = _2327 + _2941;
    float _3021 = _1771 * _3013;
    float _3023 = exp2(_2977);
    float _3025 = fma(_2217, _2997, _3017);
    float _3027 = _3011 * 0.079577468335628509521484375;
    float _3029 = _2331 + _2943;
    float _3031 = _2187 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _3033 = _2947 * _3009;
    float _3035 = fma(_2217, _3015, _3027);
    float _3037 = _2187 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _3039 = exp2(_2979);
    float _3041 = fma(_3031, _2961, _3033);
    float _3043 = _2187 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _3045 = 0.0 + _3007;
    float _3047 = precise::clamp(_3045, 0.0, 1.0);
    float _3049 = _1771 * _3025;
    float _3051 = _1771 * _3035;
    float _3053 = exp2(_2995);
    float _3055 = 0.0 + _3023;
    float _3057 = precise::clamp(_3055, 0.0, 1.0);
    float _3059 = _3051 * _2987;
    float _3061 = -_3057;
    float _3063 = _3061 + 1.0;
    float _3065 = 1.0 / _2965;
    float _3067 = 0.0 + _3039;
    float _3069 = precise::clamp(_3067, 0.0, 1.0);
    float _3071 = -_3069;
    float _3073 = _3071 + 1.0;
    float _3075 = -_3053;
    float _3077 = _3075 + 1.0;
    float _3079 = _3021 * _2971;
    float _3081 = _2947 * _3019;
    float _3083 = in.m_100.x;
    float _3085 = gl_FragCoord.w;
    float _3087 = _3083 * _3085;
    float _3089 = _2947 * _3029;
    float _3091 = _3077 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _3093 = fma(_3037, _2961, _3081);
    float _3095 = fma(_3043, _2961, _3089);
    float _3097 = -_3047;
    float _3099 = _3097 + 1.0;
    float _3101 = _3049 * _3065;
    float _3103 = fma(_3059, _3073, _3095);
    float _3105 = fma(_3079, _3099, _3041);
    float _3107 = fma(_3101, _3063, _3093);
    float _3109 = 1.0 / _3001;
    float _3111 = -_3091;
    float _3113 = _3111 + 1.0;
    float _3115 = fma(_1787, _3047, _3105);
    float _3117 = _1757 * _3091;
    float _3119 = _1781 * _1753;
    float _3121 = _1759 * _3091;
    float _3123 = fma(_1789, _3057, _3107);
    float _3125 = fma(_1791, _3069, _3103);
    float _3127 = _1781 * _3113;
    float _3129 = _1761 * _3091;
    float _3131 = fma(_3117, _3119, _1775);
    float _3133 = fma(_3121, _3119, _1777);
    float _3135 = precise::max(0.0, _3115);
    float _3137 = precise::max(0.0, _3123);
    float _3139 = fma(_3129, _3119, _1779);
    float _3141 = precise::max(0.0, _3125);
    float _3143 = fma(_3127, _3135, _3131);
    float _3145 = fma(_3127, _3137, _3133);
    float _3147 = _3109 * _3087;
    float _3149 = fma(_3127, _3141, _3139);
    out.m_103.x = _3143;
    out.m_103.y = _3145;
    out.m_103.z = _3149;
    out.m_103.w = _3147;
    out.m_105.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

