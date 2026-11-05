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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _286 = false;
    bool _284 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _945 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_945, float2(0.0), isnan(_945)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _962 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_962, float2(0.0), isnan(_962))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_962, float2(0.0), isnan(_962))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_40.x;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = -_68;
    float _100 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _102 = 1.0 / _92;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = _94 * _104;
    float _108 = _70 * _106;
    float _110 = _74 * _106;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = _96 * _112;
    float _116 = 1.0 / _100;
    float _118 = -_108;
    float _120 = fma(_114, _72, _118);
    float _122 = -_110;
    float _124 = fma(_114, _78, _122);
    float _126 = -_106;
    float _128 = _126 + _114;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = _102 * _130;
    float _134 = _120 * _120;
    float _136 = -_108;
    float _138 = fma(_132, _76, _136);
    float _140 = -_110;
    float _142 = fma(_132, _80, _140);
    float _144 = fma(_124, _124, _134);
    float _146 = -_106;
    float _148 = _146 + _132;
    float _150 = _138 * _138;
    float _152 = fma(_128, _128, _144);
    float _154 = fma(_142, _142, _150);
    float _156 = fma(_148, _148, _154);
    float _158 = rsqrt(_152);
    float _160 = rsqrt(_156);
    float _162 = _124 * _158;
    float _164 = _128 * _158;
    float _166 = _120 * _158;
    float _168 = _148 * _160;
    float _170 = _138 * _160;
    float _172 = _142 * _160;
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = -_174;
    float _180 = fma(_164, _172, _178);
    float _182 = _166 * _172;
    float _184 = -_176;
    float _186 = fma(_166, _168, _184);
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _190 = _116 * _188;
    float _192 = _180 * _180;
    float _194 = -_182;
    float _196 = fma(_162, _170, _194);
    float _198 = _190 * _74;
    float _200 = fma(_186, _186, _192);
    float _202 = -_190;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _208 = _190 * _70;
    float _210 = -_190;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _214 = fma(_196, _196, _200);
    bool _216 = !_206;
    uint _219 = uint(_216 ? 0 : 1);
    float _221 = rsqrt(_214);
    uint _223 = 2u;
    if (!_206)
    {
        _223 = 1u;
    }
    uint _225 = _223;
    uint _227 = _225;
    if (!_212)
    {
        _227 = _219;
    }
    uint _229 = _227;
    uint _231 = min(_229, 2u);
    int _234 = int(_231) << 2;
    float _236 = _180 * _221;
    float _238 = _186 * _221;
    float _240 = _196 * _221;
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _244 = uint(int(uint(_234) >> uint(2)));
    uint _246 = uint(int(uint(int(_244)) >> uint(2)));
    int _248 = int(_244) & 3;
    float _250 = (*spvDescriptorSet0.fp_c1)._m0[int(_246)][_248];
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].x, _242);
    float _254 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[35].z, _252);
    float _256 = abs(_254);
    float _258 = -_256;
    float _260 = _258 + 1.0;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = abs(_262);
    float _266 = log2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _270 = exp2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _274 = fma(_238, _272, _198);
    float _276 = fma(_236, _272, _208);
    float _278 = fma(_240, _272, _190);
    bool _280 = as_type<int>(_250) == 1344;
    if (!_280)
    {
        bool _282 = as_type<int>(_250) == 1616;
        _284 = _282;
        if (!_284)
        {
            _286 = true;
        }
    }
    float _320;
    float _322;
    float _324;
    float _326;
    if (!_284)
    {
        if (!_286)
        {
            float _288 = _276 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _290 = _276 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _292 = _276 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _294 = _276 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _296 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
            float _298 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].x, _290);
            float _300 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].x, _292);
            float _302 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].x, _294);
            float _304 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[0].z, _296);
            float _306 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[1].z, _298);
            float _308 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[2].z, _300);
            float _310 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[3].z, _302);
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _320 = _318;
            _322 = _314;
            _324 = _316;
            _326 = _312;
        }
    }
    if ((false || _286) || _284)
    {
        if ((!_286) || _284)
        {
            _284 = false;
            float _328 = _276 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _330 = _276 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _332 = _276 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _334 = _276 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _336 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].x, _328);
            float _338 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].x, _330);
            float _340 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].x, _332);
            float _342 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].x, _334);
            float _344 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[4].z, _336);
            float _346 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[5].z, _338);
            float _348 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[6].z, _340);
            float _350 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[7].z, _342);
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _320 = _358;
            _322 = _354;
            _324 = _356;
            _326 = _352;
        }
        if (false || _286)
        {
            _286 = false;
            float _360 = _276 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _362 = _276 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _364 = _276 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _366 = _276 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _368 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].x, _360);
            float _370 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].x, _362);
            float _372 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].x, _364);
            float _374 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].x, _366);
            float _376 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[8].z, _368);
            float _378 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[9].z, _370);
            float _380 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[10].z, _372);
            float _382 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[11].z, _374);
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _320 = _390;
            _322 = _386;
            _324 = _388;
            _326 = _384;
        }
    }
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = float(int(_229));
    float _402 = 1.0 / _392;
    float _404 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _406 = rint(_400);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    uint _412 = clamp(_410, 0u, 65535u);
    float _414 = _402 * _394;
    float _416 = _402 * _396;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = _402 * _398;
    float _422 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _424 = fma(_418, _404, _414);
    float _426 = fma(_418, _422, _420);
    float _428 = -_422;
    float _430 = fma(_418, _428, _420);
    float3 _1623 = float3(_420, _424, float(int(_412)));
    float3 _1627 = select(_1623, float3(0.0), isnan(_1623));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1627.xy, uint(rint(_1627.z)), _418);
    float3 _1636 = float3(_426, _424, float(int(_412)));
    float3 _1638 = select(_1636, float3(0.0), isnan(_1636));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1638.xy, uint(rint(_1638.z)), _418);
    float3 _1647 = float3(_430, _424, float(int(_412)));
    float3 _1649 = select(_1647, float3(0.0), isnan(_1647));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1649.xy, uint(rint(_1649.z)), _418);
    float _438 = -_404;
    float _440 = fma(_418, _438, _414);
    float3 _1664 = float3(_426, _414, float(int(_412)));
    float3 _1666 = select(_1664, float3(0.0), isnan(_1664));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1666.xy, uint(rint(_1666.z)), _418);
    float3 _1675 = float3(_420, _414, float(int(_412)));
    float3 _1677 = select(_1675, float3(0.0), isnan(_1675));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1677.xy, uint(rint(_1677.z)), _418);
    float3 _1686 = float3(_430, _414, float(int(_412)));
    float3 _1688 = select(_1686, float3(0.0), isnan(_1686));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1688.xy, uint(rint(_1688.z)), _418);
    float3 _1697 = float3(_426, _440, float(int(_412)));
    float3 _1699 = select(_1697, float3(0.0), isnan(_1697));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1699.xy, uint(rint(_1699.z)), _418);
    float _450 = -_208;
    float _452 = _450 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _454 = -_198;
    float _456 = _454 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _458 = _208 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _460 = _452 * _452;
    float _462 = fma(_456, _456, _460);
    float _464 = -_190;
    float _466 = _464 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _468 = fma(_466, _466, _462);
    float _470 = sqrt(_468);
    float _472 = _208 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _474 = _470 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _476 = _470 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _478 = !_474;
    int _480 = _478 ? 0 : 1;
    int _482 = 2;
    if (!_474)
    {
        _482 = 1;
    }
    int _484 = _482;
    int _486 = _484;
    if (!_476)
    {
        _486 = _480;
    }
    int _488 = _486;
    float _490 = _208 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _492 = _208 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _494 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[22].x, _458);
    float _496 = float(_488);
    float _498 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[21].x, _490);
    float _500 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[19].x, _492);
    float _502 = _208 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _504 = precise::min(_496, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _506 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[21].z, _498);
    float _508 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[24].x, _472);
    float _510 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[19].z, _500);
    bool _512 = _504 != 1.0;
    bool _514 = isnan(_504);
    bool _516 = _512 || _514;
    bool _518 = isnan(1.0);
    bool _520 = _516 || _518;
    float _522 = _208 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _524 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[22].z, _494);
    float _526 = _506 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _528 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[20].x, _502);
    float _530 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[24].z, _508);
    float _532 = _510 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _534 = _504 != 0.0;
    bool _536 = isnan(_504);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[23].x, _522);
    float _546 = _208 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _548 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[20].z, _528);
    float _550 = _208 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _552 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[23].z, _544);
    float _554 = _526;
    float _556 = _532;
    if (_520)
    {
        float _558 = _530 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _554 = _558;
    }
    float _560 = _554;
    float _562 = _560;
    if (_520)
    {
        float _564 = _524 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _556 = _564;
    }
    float _566 = _556;
    float _568 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[18].x, _546);
    float _570 = rint(_504);
    float _572 = precise::max(_570, 0.0);
    uint _574 = uint(_572);
    uint _576 = clamp(_574, 0u, 65535u);
    float _578 = _208 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _580 = _548 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _582 = _580;
    float _584 = _566;
    if (_520)
    {
        float _586 = _552 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _582 = _586;
    }
    float _588 = _582;
    float _590 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[17].x, _550);
    float _592 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[18].z, _568);
    float _594 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[16].x, _578);
    float _596 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _598 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[17].z, _590);
    float _600 = _588;
    if (!_542)
    {
        float _602 = _592 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _562 = _602;
    }
    float _604 = _562;
    float _606 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[16].z, _594);
    float _608 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (!_542)
    {
        float _610 = _598 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _600 = _610;
    }
    float _612 = _600;
    float _614 = 0.0 + _604;
    float _616 = precise::clamp(_614, 0.0, 1.0);
    if (!_542)
    {
        float _618 = _606 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _584 = _618;
    }
    float _620 = _584;
    float _622 = fma(_616, _608, _612);
    float _624 = -_596;
    float _626 = fma(_616, _624, _620);
    float _628 = fma(_616, _596, _620);
    float _630 = _434 + _432;
    float3 _2043 = float3(_420, _440, float(int(_412)));
    float3 _2045 = select(_2043, float3(0.0), isnan(_2043));
    float _632 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2045.xy, uint(rint(_2045.z)), _418);
    float3 _2054 = float3(_430, _440, float(int(_412)));
    float3 _2056 = select(_2054, float3(0.0), isnan(_2054));
    float _634 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2056.xy, uint(rint(_2056.z)), _418);
    float3 _2065 = float3(_620, _622, float(int(_576)));
    float3 _2067 = select(_2065, float3(0.0), isnan(_2065));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2067.xy, uint(rint(_2067.z)), _616);
    float _638 = _630 + _436;
    float3 _2079 = float3(_626, _622, float(int(_576)));
    float3 _2081 = select(_2079, float3(0.0), isnan(_2079));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2081.xy, uint(rint(_2081.z)), _616);
    float3 _2090 = float3(_628, _612, float(int(_576)));
    float3 _2092 = select(_2090, float3(0.0), isnan(_2090));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2092.xy, uint(rint(_2092.z)), _616);
    float3 _2101 = float3(_628, _622, float(int(_576)));
    float3 _2103 = select(_2101, float3(0.0), isnan(_2101));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2103.xy, uint(rint(_2103.z)), _616);
    float _646 = _638 + _442;
    float _648 = -_608;
    float _650 = fma(_616, _648, _612);
    float _652 = _646 + _444;
    float _654 = _652 + _446;
    float _656 = _654 + _448;
    float3 _2130 = float3(_620, _612, float(int(_576)));
    float3 _2132 = select(_2130, float3(0.0), isnan(_2130));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2132.xy, uint(rint(_2132.z)), _616);
    float3 _2141 = float3(_626, _612, float(int(_576)));
    float3 _2143 = select(_2141, float3(0.0), isnan(_2141));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2143.xy, uint(rint(_2143.z)), _616);
    float3 _2152 = float3(_628, _650, float(int(_576)));
    float3 _2154 = select(_2152, float3(0.0), isnan(_2152));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2154.xy, uint(rint(_2154.z)), _616);
    float3 _2163 = float3(_620, _650, float(int(_576)));
    float3 _2165 = select(_2163, float3(0.0), isnan(_2163));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2165.xy, uint(rint(_2165.z)), _616);
    float _666 = _208 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _668 = _208 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _670 = _208 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _672 = _208 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _674 = _208 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _676 = _208 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _678 = _208 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _680 = _208 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _682 = _208 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _684 = -_208;
    float _686 = _684 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _688 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[27].x, _670);
    float _690 = -_198;
    float _692 = _690 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _694 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[25].x, _666);
    float _696 = _686 * _686;
    float _698 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[26].x, _668);
    float _700 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[28].x, _682);
    float _702 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[29].x, _676);
    float _704 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[30].x, _674);
    float _706 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[31].x, _678);
    float _708 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[32].x, _680);
    float _710 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[33].x, _672);
    float _712 = fma(_692, _692, _696);
    float _714 = -_190;
    float _716 = _714 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _718 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[28].z, _700);
    float _720 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[29].z, _702);
    float _722 = fma(_716, _716, _712);
    float _724 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[30].z, _704);
    float _726 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[31].z, _706);
    float _728 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[32].z, _708);
    float _730 = _720 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _732 = _724 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _734 = sqrt(_722);
    float _736 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[27].z, _688);
    float _738 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[26].z, _698);
    float _740 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[25].z, _694);
    bool _742 = _734 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _744 = _734 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _746 = !_742;
    int _748 = _746 ? 0 : 1;
    int _750 = 2;
    float _752 = _730;
    float _754 = _732;
    if (!_742)
    {
        _750 = 1;
    }
    int _756 = _750;
    int _758 = _756;
    if (!_744)
    {
        _758 = _748;
    }
    int _760 = _758;
    float _762 = float(_760);
    float _764 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[33].z, _710);
    float _766 = _718 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _768 = precise::min(_762, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _770 = _768 != 1.0;
    bool _772 = isnan(_768);
    bool _774 = _770 || _772;
    bool _776 = isnan(1.0);
    bool _778 = _774 || _776;
    float _780 = _766;
    if (_778)
    {
        float _782 = _726 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _780 = _782;
    }
    float _784 = _780;
    float _786 = _784;
    if (_778)
    {
        float _788 = _728 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _752 = _788;
    }
    float _790 = _752;
    float _792 = _790;
    if (_778)
    {
        float _794 = _764 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _754 = _794;
    }
    float _796 = _754;
    bool _798 = _768 != 0.0;
    bool _800 = isnan(_768);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    float _808 = rint(_768);
    float _810 = precise::max(_808, 0.0);
    uint _812 = uint(_810);
    uint _814 = clamp(_812, 0u, 65535u);
    float _816 = _796;
    if (!_806)
    {
        float _818 = _736 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _816 = _818;
    }
    float _820 = _816;
    if (!_806)
    {
        float _822 = _738 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _792 = _822;
    }
    float _824 = _792;
    if (!_806)
    {
        float _826 = _740 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _786 = _826;
    }
    float _828 = _786;
    float _830 = 0.0 + _820;
    float _832 = precise::clamp(_830, 0.0, 1.0);
    float _834 = fma(_608, _832, _824);
    float _836 = fma(_596, _832, _828);
    float3 _2488 = float3(_626, _650, float(int(_576)));
    float3 _2490 = select(_2488, float3(0.0), isnan(_2488));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2490.xy, uint(rint(_2490.z)), _616);
    float _840 = -_596;
    float _842 = fma(_840, _832, _828);
    float3 _2505 = float3(_828, _834, float(int(_814)));
    float3 _2507 = select(_2505, float3(0.0), isnan(_2505));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2507.xy, uint(rint(_2507.z)), _832);
    float3 _2516 = float3(_836, _834, float(int(_814)));
    float3 _2518 = select(_2516, float3(0.0), isnan(_2516));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2518.xy, uint(rint(_2518.z)), _832);
    float3 _2527 = float3(_842, _834, float(int(_814)));
    float3 _2529 = select(_2527, float3(0.0), isnan(_2527));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2529.xy, uint(rint(_2529.z)), _832);
    float3 _2538 = float3(_836, _824, float(int(_814)));
    float3 _2540 = select(_2538, float3(0.0), isnan(_2538));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2540.xy, uint(rint(_2540.z)), _832);
    float _852 = -_608;
    float _854 = fma(_852, _832, _824);
    float3 _2555 = float3(_828, _824, float(int(_814)));
    float3 _2557 = select(_2555, float3(0.0), isnan(_2555));
    float _856 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2557.xy, uint(rint(_2557.z)), _832);
    float3 _2566 = float3(_842, _824, float(int(_814)));
    float3 _2568 = select(_2566, float3(0.0), isnan(_2566));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2568.xy, uint(rint(_2568.z)), _832);
    float3 _2577 = float3(_836, _854, float(int(_814)));
    float3 _2579 = select(_2577, float3(0.0), isnan(_2577));
    float _860 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2579.xy, uint(rint(_2579.z)), _832);
    float3 _2588 = float3(_828, _854, float(int(_814)));
    float3 _2590 = select(_2588, float3(0.0), isnan(_2588));
    float _862 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2590.xy, uint(rint(_2590.z)), _832);
    float3 _2599 = float3(_842, _854, float(int(_814)));
    float3 _2601 = select(_2599, float3(0.0), isnan(_2599));
    float _864 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2601.xy, uint(rint(_2601.z)), _832);
    float _866 = _656 + _632;
    float _868 = _866 + _634;
    float _870 = -_190;
    float _872 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _874 = _870 + _872;
    float _876 = _644 + _636;
    float _878 = _874 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _880 = precise::clamp(_878, 0.0, 1.0);
    float _882 = _876 + _640;
    float _884 = fma(_868, 0.111111111938953399658203125, _880);
    float _886 = -_190;
    float _888 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _890 = _886 + _888;
    float _892 = _882 + _642;
    float _894 = _890 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _896 = precise::clamp(_894, 0.0, 1.0);
    float _898 = _892 + _658;
    float _900 = _898 + _660;
    float _902 = _900 + _662;
    float _904 = _902 + _664;
    float _906 = _904 + _838;
    float _908 = _846 + _844;
    float _910 = _906 * 0.111111111938953399658203125;
    float _912 = _908 + _848;
    float _914 = _912 + _850;
    float _916 = _914 + _856;
    float _918 = _916 + _858;
    float _920 = _918 + _860;
    float _922 = _920 + _862;
    float _924 = _922 + _864;
    float _926 = _924 * 0.111111111938953399658203125;
    float _928 = _926 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _930 = fma(_910, (*spvDescriptorSet0.fp_c3)._m0[49].z, _928);
    float _932 = _930 + _896;
    out.m_47.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_47.y = _884;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _932;
    return out;
}

