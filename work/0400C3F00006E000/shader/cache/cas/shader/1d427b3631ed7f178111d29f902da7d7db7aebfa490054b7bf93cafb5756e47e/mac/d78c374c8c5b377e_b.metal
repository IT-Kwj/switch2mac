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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _282 = false;
    bool _280 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _1051 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1051, float2(0.0), isnan(_1051)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _1068 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1068, float2(0.0), isnan(_1068))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1068, float2(0.0), isnan(_1068))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_68;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _72 * _88;
    float _104 = _74 * _88;
    float _106 = -_102;
    float _108 = fma(_94, _76, _106);
    float _110 = -_102;
    float _112 = fma(_100, _78, _110);
    float _114 = -_104;
    float _116 = fma(_94, _80, _114);
    float _118 = -_104;
    float _120 = fma(_100, _82, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_88;
    float _128 = _126 + _94;
    float _130 = -_88;
    float _132 = _130 + _100;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = fma(_128, _128, _134);
    float _140 = fma(_132, _132, _136);
    float _142 = rsqrt(_138);
    float _144 = rsqrt(_140);
    float _146 = _116 * _142;
    float _148 = _128 * _142;
    float _150 = _108 * _142;
    float _152 = _132 * _144;
    float _154 = _112 * _144;
    float _156 = _120 * _144;
    float _158 = _146 * _152;
    float _160 = _148 * _154;
    float _162 = -_158;
    float _164 = fma(_148, _156, _162);
    float _166 = -_70;
    float _168 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _170 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[46].z, _168);
    float _172 = _150 * _156;
    float _174 = -_160;
    float _176 = fma(_150, _152, _174);
    float _178 = _164 * _164;
    float _180 = -_172;
    float _182 = fma(_146, _154, _180);
    float _184 = -_170;
    bool _188 = _184 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _190 = fma(_176, _176, _178);
    float _192 = -_170;
    bool _194 = _192 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _196 = _170 * _74;
    float _198 = -_170;
    bool _200 = _198 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _202 = fma(_182, _182, _190);
    bool _204 = !_188;
    int _207 = _204 ? 0 : 1;
    float _209 = _170 * _72;
    float _211 = rsqrt(_202);
    int _213 = 2;
    if (!_188)
    {
        _213 = 1;
    }
    int _215 = _213;
    int _217 = _215;
    if (!_194)
    {
        _217 = _207;
    }
    int _219 = _217;
    int _221 = _219 + 1;
    uint _224 = uint(_221);
    if (!_200)
    {
        _224 = uint(_219);
    }
    uint _226 = _224;
    uint _228 = min(_226, 2u);
    float _230 = _164 * _211;
    float _232 = _176 * _211;
    int _234 = int(_228) << 2;
    float _236 = _182 * _211;
    float _238 = _230 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _240 = uint(int(uint(_234) >> uint(2)));
    uint _242 = uint(int(uint(int(_240)) >> uint(2)));
    int _244 = int(_240) & 3;
    float _246 = (*spvDescriptorSet0.fp_c1)._m0[int(_242)][_244];
    float _248 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].x, _238);
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].z, _248);
    float _252 = abs(_250);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = abs(_258);
    float _262 = log2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _266 = exp2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _270 = fma(_232, _268, _196);
    float _272 = fma(_230, _268, _209);
    float _274 = fma(_236, _268, _170);
    bool _276 = as_type<int>(_246) == 1264;
    if (!_276)
    {
        bool _278 = as_type<int>(_246) == 1536;
        _280 = _278;
        if (!_280)
        {
            _282 = true;
        }
    }
    float _316;
    float _318;
    float _320;
    float _322;
    if (!_280)
    {
        if (!_282)
        {
            float _284 = _272 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _286 = _272 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _288 = _272 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _290 = _272 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _292 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].x, _284);
            float _294 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].x, _286);
            float _296 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].x, _288);
            float _298 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].x, _290);
            float _300 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].z, _292);
            float _302 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].z, _294);
            float _304 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].z, _296);
            float _306 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].z, _298);
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _316 = _314;
            _318 = _312;
            _320 = _308;
            _322 = _310;
        }
    }
    if ((false || _282) || _280)
    {
        if ((!_282) || _280)
        {
            _280 = false;
            float _324 = _272 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _326 = _272 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _328 = _272 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _330 = _272 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _332 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[4].x, _324);
            float _334 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[5].x, _326);
            float _336 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[6].x, _328);
            float _338 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[7].x, _330);
            float _340 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].z, _332);
            float _342 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].z, _334);
            float _344 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].z, _336);
            float _346 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].z, _338);
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _316 = _354;
            _318 = _352;
            _320 = _348;
            _322 = _350;
        }
        if (false || _282)
        {
            _282 = false;
            float _356 = _272 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _358 = _272 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _360 = _272 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _362 = _272 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _364 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[8].x, _356);
            float _366 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[9].x, _358);
            float _368 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[10].x, _360);
            float _370 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[11].x, _362);
            float _372 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].z, _364);
            float _374 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].z, _366);
            float _376 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].z, _368);
            float _378 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].z, _370);
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _316 = _386;
            _318 = _384;
            _320 = _380;
            _322 = _382;
        }
    }
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = 1.0 / _388;
    float _398 = float(int(_226));
    float _400 = rint(_398);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    uint _406 = clamp(_404, 0u, 65535u);
    float _408 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _410 = _396 * _390;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = _396 * _392;
    float _416 = _396 * _394;
    float _418 = _412 * _408;
    float _420 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _422 = fma(_418, 0.5, _414);
    float _424 = _412 * _420;
    float _426 = fma(_418, 1.5, _414);
    float _428 = fma(_418, -0.5, _414);
    float _430 = fma(_418, -1.5, _414);
    float _432 = fma(_424, 1.5, _416);
    float _434 = fma(_424, 0.5, _416);
    float3 _1743 = float3(_422, _432, float(int(_406)));
    float3 _1747 = select(_1743, float3(0.0), isnan(_1743));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1747.xy, uint(rint(_1747.z)), _412);
    float3 _1756 = float3(_426, _432, float(int(_406)));
    float3 _1758 = select(_1756, float3(0.0), isnan(_1756));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1758.xy, uint(rint(_1758.z)), _412);
    float3 _1767 = float3(_428, _432, float(int(_406)));
    float3 _1769 = select(_1767, float3(0.0), isnan(_1767));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1769.xy, uint(rint(_1769.z)), _412);
    float3 _1778 = float3(_430, _432, float(int(_406)));
    float3 _1780 = select(_1778, float3(0.0), isnan(_1778));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1780.xy, uint(rint(_1780.z)), _412);
    float3 _1789 = float3(_426, _434, float(int(_406)));
    float3 _1791 = select(_1789, float3(0.0), isnan(_1789));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1791.xy, uint(rint(_1791.z)), _412);
    float3 _1800 = float3(_422, _434, float(int(_406)));
    float3 _1802 = select(_1800, float3(0.0), isnan(_1800));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1802.xy, uint(rint(_1802.z)), _412);
    float _448 = _438 + _436;
    float _450 = _448 + _440;
    float _452 = _450 + _442;
    float _454 = _452 + _444;
    float _456 = _454 + _446;
    float _458 = fma(_424, -0.5, _416);
    float3 _1829 = float3(_428, _434, float(int(_406)));
    float3 _1831 = select(_1829, float3(0.0), isnan(_1829));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1831.xy, uint(rint(_1831.z)), _412);
    float3 _1840 = float3(_430, _434, float(int(_406)));
    float3 _1842 = select(_1840, float3(0.0), isnan(_1840));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1842.xy, uint(rint(_1842.z)), _412);
    float3 _1851 = float3(_426, _458, float(int(_406)));
    float3 _1853 = select(_1851, float3(0.0), isnan(_1851));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1853.xy, uint(rint(_1853.z)), _412);
    float3 _1862 = float3(_422, _458, float(int(_406)));
    float3 _1864 = select(_1862, float3(0.0), isnan(_1862));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1864.xy, uint(rint(_1864.z)), _412);
    float3 _1873 = float3(_428, _458, float(int(_406)));
    float3 _1875 = select(_1873, float3(0.0), isnan(_1873));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1875.xy, uint(rint(_1875.z)), _412);
    float3 _1884 = float3(_430, _458, float(int(_406)));
    float3 _1886 = select(_1884, float3(0.0), isnan(_1884));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1886.xy, uint(rint(_1886.z)), _412);
    float _472 = fma(_424, -1.5, _416);
    float _474 = -_209;
    float _476 = _474 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _478 = -_196;
    float _480 = _478 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _482 = _476 * _476;
    float _484 = fma(_480, _480, _482);
    float _486 = -_170;
    float _488 = _486 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _490 = fma(_488, _488, _484);
    float _492 = sqrt(_490);
    bool _494 = _492 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _496 = _492 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _498 = !_494;
    int _500 = _498 ? 0 : 1;
    int _502 = 2;
    if (!_494)
    {
        _502 = 1;
    }
    int _504 = _502;
    int _506 = _504;
    if (!_496)
    {
        _506 = _500;
    }
    int _508 = _506;
    float _510 = _209 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _512 = float(_508);
    float _514 = _209 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _516 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[19].x, _510);
    float _518 = _209 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _520 = precise::min(_512, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _522 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[22].x, _514);
    float _524 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[19].z, _516);
    float _526 = _209 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _528 = _520 != 1.0;
    bool _530 = isnan(_520);
    bool _532 = _528 || _530;
    bool _534 = isnan(1.0);
    bool _536 = _532 || _534;
    float _538 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[22].z, _522);
    float _540 = _524 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _542 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[23].x, _526);
    float _544 = _209 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _546 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[23].z, _542);
    float _548 = _540;
    if (_536)
    {
        float _550 = _538 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _548 = _550;
    }
    float _552 = _548;
    float _554 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[20].x, _518);
    float _556 = _209 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _558 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[20].z, _554);
    float _560 = _558 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _562 = _560;
    float _564 = _552;
    if (_536)
    {
        float _566 = _546 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _562 = _566;
    }
    float _568 = _562;
    float _570 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[24].x, _544);
    float _572 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[21].x, _556);
    float3 _2082 = float3(_426, _472, float(int(_406)));
    float3 _2084 = select(_2082, float3(0.0), isnan(_2082));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2084.xy, uint(rint(_2084.z)), _412);
    float _576 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[24].z, _570);
    float _578 = _209 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _580 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[21].z, _572);
    float _582 = _580 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _584 = _582;
    float _586 = _568;
    if (_536)
    {
        float _588 = _576 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _584 = _588;
    }
    float _590 = _584;
    bool _592 = _520 != 0.0;
    bool _594 = isnan(_520);
    bool _596 = _592 || _594;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    float _602 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[16].x, _578);
    float _604 = _209 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _606 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[16].z, _602);
    float _608 = _590;
    if (!_600)
    {
        float _610 = _606 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _564 = _610;
    }
    float _612 = _564;
    float _614 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[17].x, _604);
    float _616 = _209 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _618 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[17].z, _614);
    if (!_600)
    {
        float _620 = _618 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _586 = _620;
    }
    float _622 = _586;
    float _624 = _456 + _460;
    float _626 = _624 + _462;
    float _628 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[18].x, _616);
    float _630 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _632 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _634 = _626 + _464;
    float _636 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[18].z, _628);
    float _638 = rint(_520);
    float _640 = precise::max(_638, 0.0);
    uint _642 = uint(_640);
    uint _644 = clamp(_642, 0u, 65535u);
    float _646 = _634 + _466;
    if (!_600)
    {
        float _648 = _636 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _608 = _648;
    }
    float _650 = _608;
    float _652 = _646 + _468;
    float _654 = 0.0 + _650;
    float _656 = precise::clamp(_654, 0.0, 1.0);
    float _658 = _656 * _632;
    float3 _2245 = float3(_422, _472, float(int(_406)));
    float3 _2247 = select(_2245, float3(0.0), isnan(_2245));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2247.xy, uint(rint(_2247.z)), _412);
    float3 _2256 = float3(_428, _472, float(int(_406)));
    float3 _2258 = select(_2256, float3(0.0), isnan(_2256));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2258.xy, uint(rint(_2258.z)), _412);
    float3 _2267 = float3(_430, _472, float(int(_406)));
    float3 _2269 = select(_2267, float3(0.0), isnan(_2267));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2269.xy, uint(rint(_2269.z)), _412);
    float _666 = _656 * _630;
    float _668 = fma(_658, 1.5, _622);
    float _670 = fma(_666, 0.5, _612);
    float _672 = fma(_666, -0.5, _612);
    float3 _2290 = float3(_670, _668, float(int(_644)));
    float3 _2292 = select(_2290, float3(0.0), isnan(_2290));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2292.xy, uint(rint(_2292.z)), _656);
    float3 _2301 = float3(_672, _668, float(int(_644)));
    float3 _2303 = select(_2301, float3(0.0), isnan(_2301));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2303.xy, uint(rint(_2303.z)), _656);
    float _678 = _652 + _470;
    float _680 = fma(_658, 0.5, _622);
    float _682 = fma(_666, -1.5, _612);
    float _684 = _678 + _574;
    float _686 = _684 + _660;
    float _688 = fma(_666, 1.5, _612);
    float _690 = _686 + _662;
    float3 _2333 = float3(_682, _668, float(int(_644)));
    float3 _2335 = select(_2333, float3(0.0), isnan(_2333));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2335.xy, uint(rint(_2335.z)), _656);
    float3 _2344 = float3(_688, _668, float(int(_644)));
    float3 _2346 = select(_2344, float3(0.0), isnan(_2344));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2346.xy, uint(rint(_2346.z)), _656);
    float3 _2355 = float3(_688, _680, float(int(_644)));
    float3 _2357 = select(_2355, float3(0.0), isnan(_2355));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2357.xy, uint(rint(_2357.z)), _656);
    float3 _2366 = float3(_670, _680, float(int(_644)));
    float3 _2368 = select(_2366, float3(0.0), isnan(_2366));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2368.xy, uint(rint(_2368.z)), _656);
    float3 _2377 = float3(_672, _680, float(int(_644)));
    float3 _2379 = select(_2377, float3(0.0), isnan(_2377));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2379.xy, uint(rint(_2379.z)), _656);
    float3 _2388 = float3(_682, _680, float(int(_644)));
    float3 _2390 = select(_2388, float3(0.0), isnan(_2388));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2390.xy, uint(rint(_2390.z)), _656);
    float _704 = _690 + _664;
    float _706 = fma(_658, -0.5, _622);
    float _708 = fma(_658, -1.5, _622);
    float3 _2408 = float3(_688, _706, float(int(_644)));
    float3 _2410 = select(_2408, float3(0.0), isnan(_2408));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2410.xy, uint(rint(_2410.z)), _656);
    float _712 = _694 + _674;
    float _714 = _712 + _676;
    float _716 = _714 + _692;
    float _718 = _716 + _696;
    float _720 = _718 + _698;
    float _722 = _720 + _700;
    float3 _2437 = float3(_670, _706, float(int(_644)));
    float3 _2439 = select(_2437, float3(0.0), isnan(_2437));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2439.xy, uint(rint(_2439.z)), _656);
    float3 _2448 = float3(_672, _706, float(int(_644)));
    float3 _2450 = select(_2448, float3(0.0), isnan(_2448));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2450.xy, uint(rint(_2450.z)), _656);
    float3 _2459 = float3(_682, _706, float(int(_644)));
    float3 _2461 = select(_2459, float3(0.0), isnan(_2459));
    float _728 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2461.xy, uint(rint(_2461.z)), _656);
    float3 _2470 = float3(_688, _708, float(int(_644)));
    float3 _2472 = select(_2470, float3(0.0), isnan(_2470));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2472.xy, uint(rint(_2472.z)), _656);
    float3 _2481 = float3(_670, _708, float(int(_644)));
    float3 _2483 = select(_2481, float3(0.0), isnan(_2481));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2483.xy, uint(rint(_2483.z)), _656);
    float _734 = _209 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _736 = _722 + _702;
    float _738 = _209 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _740 = _209 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _742 = _209 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _744 = _209 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _746 = _736 + _710;
    float _748 = _209 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _750 = -_209;
    float _752 = _750 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _754 = _209 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _756 = _209 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _758 = _209 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _760 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[29].x, _734);
    float _762 = -_196;
    float _764 = _762 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _766 = _752 * _752;
    float _768 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[28].x, _738);
    float _770 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[25].x, _740);
    float _772 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[26].x, _742);
    float _774 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[27].x, _744);
    float _776 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[30].x, _758);
    float _778 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[31].x, _754);
    float _780 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[32].x, _748);
    float _782 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[33].x, _756);
    float _784 = fma(_764, _764, _766);
    float _786 = -_170;
    float _788 = _786 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _790 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[28].z, _768);
    float _792 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[29].z, _760);
    float _794 = fma(_788, _788, _784);
    float _796 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[30].z, _776);
    float _798 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[31].z, _778);
    float _800 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[32].z, _780);
    float _802 = _792 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _804 = _796 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _806 = sqrt(_794);
    float _808 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[25].z, _770);
    float _810 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[27].z, _774);
    float _812 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[26].z, _772);
    bool _814 = _806 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _816 = _806 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _818 = !_814;
    int _820 = _818 ? 0 : 1;
    int _822 = 2;
    float _824 = _802;
    float _826 = _804;
    if (!_814)
    {
        _822 = 1;
    }
    int _828 = _822;
    int _830 = _828;
    if (!_816)
    {
        _830 = _820;
    }
    int _832 = _830;
    float _834 = float(_832);
    float _836 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[33].z, _782);
    float _838 = _790 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _840 = precise::min(_834, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _842 = _840 != 1.0;
    bool _844 = isnan(_840);
    bool _846 = _842 || _844;
    bool _848 = isnan(1.0);
    bool _850 = _846 || _848;
    float _852 = _838;
    if (_850)
    {
        float _854 = _798 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _852 = _854;
    }
    float _856 = _852;
    float _858 = _856;
    if (_850)
    {
        float _860 = _800 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _824 = _860;
    }
    float _862 = _824;
    float _864 = _862;
    if (_850)
    {
        float _866 = _836 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _826 = _866;
    }
    float _868 = _826;
    bool _870 = _840 != 0.0;
    bool _872 = isnan(_840);
    bool _874 = _870 || _872;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    float _880 = _868;
    if (!_878)
    {
        float _882 = _808 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _858 = _882;
    }
    float _884 = _858;
    if (!_878)
    {
        float _886 = _810 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _880 = _886;
    }
    float _888 = _880;
    float _890 = rint(_840);
    float _892 = precise::max(_890, 0.0);
    uint _894 = uint(_892);
    uint _896 = clamp(_894, 0u, 65535u);
    if (!_878)
    {
        float _898 = _812 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _864 = _898;
    }
    float _900 = _864;
    float _902 = 0.0 + _888;
    float _904 = precise::clamp(_902, 0.0, 1.0);
    float _906 = _630 * _904;
    float _908 = _632 * _904;
    float _910 = fma(_906, 0.5, _884);
    float _912 = fma(_908, 1.5, _900);
    float _914 = fma(_906, 1.5, _884);
    float _916 = fma(_908, 0.5, _900);
    float _918 = _746 + _724;
    float _920 = _918 + _726;
    float _922 = _920 + _728;
    float3 _2831 = float3(_672, _708, float(int(_644)));
    float3 _2833 = select(_2831, float3(0.0), isnan(_2831));
    float _924 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2833.xy, uint(rint(_2833.z)), _656);
    float3 _2842 = float3(_682, _708, float(int(_644)));
    float3 _2844 = select(_2842, float3(0.0), isnan(_2842));
    float _926 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2844.xy, uint(rint(_2844.z)), _656);
    float3 _2853 = float3(_910, _912, float(int(_896)));
    float3 _2855 = select(_2853, float3(0.0), isnan(_2853));
    float _928 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2855.xy, uint(rint(_2855.z)), _904);
    float3 _2864 = float3(_914, _912, float(int(_896)));
    float3 _2866 = select(_2864, float3(0.0), isnan(_2864));
    float _930 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2866.xy, uint(rint(_2866.z)), _904);
    float3 _2875 = float3(_910, _916, float(int(_896)));
    float3 _2877 = select(_2875, float3(0.0), isnan(_2875));
    float _932 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2877.xy, uint(rint(_2877.z)), _904);
    float _934 = fma(_906, -0.5, _884);
    float _936 = fma(_906, -1.5, _884);
    float3 _2892 = float3(_934, _912, float(int(_896)));
    float3 _2894 = select(_2892, float3(0.0), isnan(_2892));
    float _938 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2894.xy, uint(rint(_2894.z)), _904);
    float3 _2903 = float3(_936, _912, float(int(_896)));
    float3 _2905 = select(_2903, float3(0.0), isnan(_2903));
    float _940 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2905.xy, uint(rint(_2905.z)), _904);
    float3 _2914 = float3(_914, _916, float(int(_896)));
    float3 _2916 = select(_2914, float3(0.0), isnan(_2914));
    float _942 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2916.xy, uint(rint(_2916.z)), _904);
    float3 _2925 = float3(_934, _916, float(int(_896)));
    float3 _2927 = select(_2925, float3(0.0), isnan(_2925));
    float _944 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2927.xy, uint(rint(_2927.z)), _904);
    float3 _2936 = float3(_936, _916, float(int(_896)));
    float3 _2938 = select(_2936, float3(0.0), isnan(_2936));
    float _946 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2938.xy, uint(rint(_2938.z)), _904);
    float _948 = fma(_908, -1.5, _900);
    float _950 = fma(_908, -0.5, _900);
    float3 _2953 = float3(_910, _950, float(int(_896)));
    float3 _2955 = select(_2953, float3(0.0), isnan(_2953));
    float _952 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2955.xy, uint(rint(_2955.z)), _904);
    float3 _2964 = float3(_934, _950, float(int(_896)));
    float3 _2966 = select(_2964, float3(0.0), isnan(_2964));
    float _954 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2966.xy, uint(rint(_2966.z)), _904);
    float3 _2975 = float3(_914, _950, float(int(_896)));
    float3 _2977 = select(_2975, float3(0.0), isnan(_2975));
    float _956 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2977.xy, uint(rint(_2977.z)), _904);
    float3 _2986 = float3(_936, _950, float(int(_896)));
    float3 _2988 = select(_2986, float3(0.0), isnan(_2986));
    float _958 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2988.xy, uint(rint(_2988.z)), _904);
    float3 _2997 = float3(_914, _948, float(int(_896)));
    float3 _2999 = select(_2997, float3(0.0), isnan(_2997));
    float _960 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2999.xy, uint(rint(_2999.z)), _904);
    float3 _3008 = float3(_910, _948, float(int(_896)));
    float3 _3010 = select(_3008, float3(0.0), isnan(_3008));
    float _962 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3010.xy, uint(rint(_3010.z)), _904);
    float3 _3019 = float3(_934, _948, float(int(_896)));
    float3 _3021 = select(_3019, float3(0.0), isnan(_3019));
    float _964 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3021.xy, uint(rint(_3021.z)), _904);
    float3 _3030 = float3(_936, _948, float(int(_896)));
    float3 _3032 = select(_3030, float3(0.0), isnan(_3030));
    float _966 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3032.xy, uint(rint(_3032.z)), _904);
    float2 _3038 = float2(_56, _58);
    float _968 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3038, float2(0.0), isnan(_3038))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3038, float2(0.0), isnan(_3038))).x;
    float _970 = _922 + _730;
    float _972 = -_170;
    float _974 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _976 = _972 + _974;
    float _978 = -_170;
    float _980 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _982 = _978 + _980;
    float _984 = _970 + _732;
    float _986 = _976 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _988 = precise::clamp(_986, 0.0, 1.0);
    float _990 = fma(_704, 0.0625, _988);
    float _992 = _984 + _924;
    float _994 = _930 + _928;
    float _996 = _992 + _926;
    float _998 = _994 + _938;
    float _1000 = _998 + _940;
    float _1002 = _1000 + _942;
    float _1004 = _1002 + _932;
    float _1006 = _1004 + _944;
    float _1008 = _1006 + _946;
    float _1010 = _1008 + _956;
    float _1012 = _1010 + _952;
    float _1014 = _1012 + _954;
    float _1016 = _1014 + _958;
    float _1018 = _1016 + _960;
    float _1020 = _1018 + _962;
    float _1022 = _1020 + _964;
    float _1024 = _1022 + _966;
    float _1026 = _1024 * 0.0625;
    float _1028 = _996 * 0.0625;
    float _1030 = _1026 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1032 = fma(_1028, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1030);
    float _1034 = _982 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _1036 = precise::clamp(_1034, 0.0, 1.0);
    float _1038 = _1032 + _1036;
    out.m_49.x = _968;
    out.m_49.y = _990;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _1038;
    return out;
}

