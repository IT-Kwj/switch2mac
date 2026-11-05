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
    float2 _943 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_943, float2(0.0), isnan(_943)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _960 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_960, float2(0.0), isnan(_960))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_960, float2(0.0), isnan(_960))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_44.y;
    float _76 = in.m_42.x;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = _72 * _88;
    float _98 = _76 * _88;
    float _100 = -_96;
    float _102 = fma(_94, _74, _100);
    float _104 = -_68;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[46].z, _106);
    float _110 = -_98;
    float _112 = fma(_94, _80, _110);
    float _114 = -_88;
    float _116 = _114 + _94;
    float _118 = _102 * _102;
    float _120 = -_96;
    float _122 = fma(_108, _78, _120);
    float _124 = -_98;
    float _126 = fma(_108, _82, _124);
    float _128 = -_88;
    float _130 = _128 + _108;
    float _132 = fma(_112, _112, _118);
    float _134 = _122 * _122;
    float _136 = -_70;
    float _138 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _140 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[46].z, _138);
    float _142 = fma(_116, _116, _132);
    float _144 = fma(_126, _126, _134);
    float _146 = _140 * _76;
    float _148 = -_140;
    bool _152 = _148 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _154 = _140 * _72;
    float _156 = fma(_130, _130, _144);
    float _158 = rsqrt(_142);
    float _160 = -_140;
    bool _162 = _160 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _164 = -_140;
    bool _166 = _164 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _168 = rsqrt(_156);
    int _171 = 2;
    if (!_152)
    {
        _171 = 1;
    }
    int _173 = _171;
    float _175 = _112 * _158;
    float _177 = _116 * _158;
    float _179 = _102 * _158;
    float _181 = _130 * _168;
    float _183 = _122 * _168;
    float _185 = _126 * _168;
    float _187 = _175 * _181;
    float _189 = _177 * _183;
    float _191 = _179 * _185;
    float _193 = -_187;
    float _195 = fma(_177, _185, _193);
    float _197 = -_189;
    float _199 = fma(_179, _181, _197);
    float _201 = -_191;
    float _203 = fma(_175, _183, _201);
    float _205 = _195 * _195;
    float _207 = fma(_199, _199, _205);
    bool _209 = !_152;
    int _211 = _209 ? 0 : 1;
    float _213 = fma(_203, _203, _207);
    int _215 = _173;
    if (!_162)
    {
        _215 = _211;
    }
    int _217 = _215;
    float _219 = rsqrt(_213);
    int _221 = _217 + 1;
    uint _224 = uint(_221);
    if (!_166)
    {
        _224 = uint(_217);
    }
    uint _226 = _224;
    uint _228 = min(_226, 2u);
    int _230 = int(_228) << 2;
    float _232 = _195 * _219;
    float _234 = _199 * _219;
    float _236 = _203 * _219;
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _240 = uint(int(uint(_230) >> uint(2)));
    uint _242 = uint(int(uint(int(_240)) >> uint(2)));
    int _244 = int(_240) & 3;
    float _246 = (*spvDescriptorSet0.fp_c1)._m0[int(_242)][_244];
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].x, _238);
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
    float _270 = fma(_234, _268, _146);
    float _272 = fma(_232, _268, _154);
    float _274 = fma(_236, _268, _140);
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
            _320 = _310;
            _322 = _308;
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
            _320 = _350;
            _322 = _348;
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
            _320 = _382;
            _322 = _380;
        }
    }
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = float(int(_226));
    float _398 = 1.0 / _388;
    float _400 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _402 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _404 = rint(_396);
    float _406 = precise::max(_404, 0.0);
    uint _408 = uint(_406);
    uint _410 = clamp(_408, 0u, 65535u);
    float _412 = _398 * _390;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    float _416 = _398 * _392;
    float _418 = _398 * _394;
    float _420 = fma(_414, _400, _416);
    float _422 = fma(_414, _402, _418);
    float _424 = -_402;
    float _426 = fma(_414, _424, _418);
    float3 _1621 = float3(_418, _420, float(int(_410)));
    float3 _1625 = select(_1621, float3(0.0), isnan(_1621));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1625.xy, uint(rint(_1625.z)), _414);
    float3 _1634 = float3(_422, _420, float(int(_410)));
    float3 _1636 = select(_1634, float3(0.0), isnan(_1634));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1636.xy, uint(rint(_1636.z)), _414);
    float3 _1645 = float3(_426, _420, float(int(_410)));
    float3 _1647 = select(_1645, float3(0.0), isnan(_1645));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1647.xy, uint(rint(_1647.z)), _414);
    float3 _1656 = float3(_422, _416, float(int(_410)));
    float3 _1658 = select(_1656, float3(0.0), isnan(_1656));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1658.xy, uint(rint(_1658.z)), _414);
    float3 _1667 = float3(_418, _416, float(int(_410)));
    float3 _1669 = select(_1667, float3(0.0), isnan(_1667));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1669.xy, uint(rint(_1669.z)), _414);
    float3 _1678 = float3(_426, _416, float(int(_410)));
    float3 _1680 = select(_1678, float3(0.0), isnan(_1678));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1680.xy, uint(rint(_1680.z)), _414);
    float _440 = -_154;
    float _442 = _440 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _444 = -_146;
    float _446 = _444 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _448 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _450 = -_400;
    float _452 = fma(_414, _450, _416);
    float _454 = _442 * _442;
    float _456 = _154 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _458 = _154 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _460 = fma(_446, _446, _454);
    float _462 = -_140;
    float _464 = _462 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _466 = _154 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _468 = _154 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _470 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[24].x, _456);
    float _472 = fma(_464, _464, _460);
    float _474 = _154 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _476 = _154 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _478 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[22].x, _466);
    float _480 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[23].x, _468);
    float _482 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[19].x, _474);
    float _484 = sqrt(_472);
    float _486 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[20].x, _476);
    float _488 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[22].z, _478);
    float _490 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[19].z, _482);
    float _492 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[23].z, _480);
    float _494 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[20].z, _486);
    float _496 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[18].x, _458);
    float _498 = _490 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _500 = _154 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _502 = _494 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _504 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[24].z, _470);
    float _506 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[18].z, _496);
    float _508 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _510 = _484 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _512 = _484 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _514 = !_510;
    int _516 = _514 ? 0 : 1;
    int _518 = 2;
    float _520 = _498;
    float _522 = _502;
    if (!_510)
    {
        _518 = 1;
    }
    int _524 = _518;
    int _526 = _524;
    if (!_512)
    {
        _526 = _516;
    }
    int _528 = _526;
    float _530 = float(_528);
    float _532 = precise::min(_530, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _534 = _532 != 1.0;
    bool _536 = isnan(_532);
    bool _538 = _534 || _536;
    bool _540 = isnan(1.0);
    bool _542 = _538 || _540;
    bool _544 = _532 != 0.0;
    bool _546 = isnan(_532);
    bool _548 = _544 || _546;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    float _554 = rint(_532);
    float _556 = precise::max(_554, 0.0);
    uint _558 = uint(_556);
    uint _560 = clamp(_558, 0u, 65535u);
    if (_542)
    {
        float _562 = _488 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _520 = _562;
    }
    float _564 = _520;
    float _566 = _154 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _568 = _564;
    if (_542)
    {
        float _570 = _492 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _522 = _570;
    }
    float _572 = _522;
    float _574 = _154 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _576 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[21].x, _566);
    float _578 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[17].x, _574);
    float _580 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[21].z, _576);
    float _582 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[16].x, _500);
    float _584 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[17].z, _578);
    float _586 = _580 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _588 = _586;
    float _590 = _572;
    if (_542)
    {
        float _592 = _504 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _588 = _592;
    }
    float _594 = _588;
    float _596 = _594;
    if (!_552)
    {
        float _598 = _506 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _596 = _598;
    }
    float _600 = _596;
    float _602 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[16].z, _582);
    if (!_552)
    {
        float _604 = _584 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _590 = _604;
    }
    float _606 = _590;
    float _608 = 0.0 + _600;
    float _610 = precise::clamp(_608, 0.0, 1.0);
    if (!_552)
    {
        float _612 = _602 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _568 = _612;
    }
    float _614 = _568;
    float3 _2013 = float3(_422, _452, float(int(_410)));
    float3 _2015 = select(_2013, float3(0.0), isnan(_2013));
    float _616 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2015.xy, uint(rint(_2015.z)), _414);
    float _618 = fma(_610, _508, _606);
    float _620 = _430 + _428;
    float _622 = _620 + _432;
    float3 _2034 = float3(_418, _452, float(int(_410)));
    float3 _2036 = select(_2034, float3(0.0), isnan(_2034));
    float _624 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2036.xy, uint(rint(_2036.z)), _414);
    float3 _2045 = float3(_426, _452, float(int(_410)));
    float3 _2047 = select(_2045, float3(0.0), isnan(_2045));
    float _626 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2047.xy, uint(rint(_2047.z)), _414);
    float3 _2056 = float3(_614, _618, float(int(_560)));
    float3 _2058 = select(_2056, float3(0.0), isnan(_2056));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2058.xy, uint(rint(_2058.z)), _610);
    float _630 = _622 + _434;
    float _632 = -_448;
    float _634 = fma(_610, _632, _614);
    float3 _2076 = float3(_634, _618, float(int(_560)));
    float3 _2078 = select(_2076, float3(0.0), isnan(_2076));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2078.xy, uint(rint(_2078.z)), _610);
    float3 _2087 = float3(_614, _606, float(int(_560)));
    float3 _2089 = select(_2087, float3(0.0), isnan(_2087));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2089.xy, uint(rint(_2089.z)), _610);
    float _640 = _630 + _436;
    float _642 = -_508;
    float _644 = fma(_610, _642, _606);
    float _646 = _640 + _438;
    float _648 = fma(_610, _448, _614);
    float3 _2114 = float3(_648, _606, float(int(_560)));
    float3 _2116 = select(_2114, float3(0.0), isnan(_2114));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2116.xy, uint(rint(_2116.z)), _610);
    float3 _2125 = float3(_648, _618, float(int(_560)));
    float3 _2127 = select(_2125, float3(0.0), isnan(_2125));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2127.xy, uint(rint(_2127.z)), _610);
    float3 _2136 = float3(_634, _606, float(int(_560)));
    float3 _2138 = select(_2136, float3(0.0), isnan(_2136));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2138.xy, uint(rint(_2138.z)), _610);
    float3 _2147 = float3(_648, _644, float(int(_560)));
    float3 _2149 = select(_2147, float3(0.0), isnan(_2147));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2149.xy, uint(rint(_2149.z)), _610);
    float3 _2158 = float3(_614, _644, float(int(_560)));
    float3 _2160 = select(_2158, float3(0.0), isnan(_2158));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2160.xy, uint(rint(_2160.z)), _610);
    float3 _2169 = float3(_634, _644, float(int(_560)));
    float3 _2171 = select(_2169, float3(0.0), isnan(_2169));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2171.xy, uint(rint(_2171.z)), _610);
    float _662 = _154 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _664 = _154 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _666 = _154 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _668 = _154 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _670 = _154 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _672 = _154 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _674 = _154 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _676 = _154 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _678 = -_146;
    float _680 = _678 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _682 = _154 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _684 = -_154;
    float _686 = _684 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _688 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[27].x, _668);
    float _690 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[28].x, _666);
    float _692 = _686 * _686;
    float _694 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[29].x, _682);
    float _696 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[30].x, _662);
    float _698 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[31].x, _672);
    float _700 = fma(_680, _680, _692);
    float _702 = -_140;
    float _704 = _702 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _706 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[32].x, _674);
    float _708 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[33].x, _676);
    float _710 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[28].z, _690);
    float _712 = fma(_704, _704, _700);
    float _714 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[29].z, _694);
    float _716 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[30].z, _696);
    float _718 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[31].z, _698);
    float _720 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[32].z, _706);
    float _722 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[33].z, _708);
    float _724 = sqrt(_712);
    float _726 = _710 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _728 = _716 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _730 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[26].x, _670);
    float _732 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[27].z, _688);
    float _734 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[25].x, _664);
    float _736 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[26].z, _730);
    float _738 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[25].z, _734);
    bool _740 = _724 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _742 = _724 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _744 = !_740;
    int _746 = _744 ? 0 : 1;
    int _748 = 2;
    float _750 = _726;
    float _752 = _728;
    if (!_740)
    {
        _748 = 1;
    }
    int _754 = _748;
    int _756 = _754;
    if (!_742)
    {
        _756 = _746;
    }
    int _758 = _756;
    float _760 = float(_758);
    float _762 = _714 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _764 = precise::min(_760, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _766 = _764 != 1.0;
    bool _768 = isnan(_764);
    bool _770 = _766 || _768;
    bool _772 = isnan(1.0);
    bool _774 = _770 || _772;
    float _776 = _762;
    if (_774)
    {
        float _778 = _718 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _750 = _778;
    }
    float _780 = _750;
    float _782 = _780;
    if (_774)
    {
        float _784 = _720 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _776 = _784;
    }
    float _786 = _776;
    float _788 = _786;
    if (_774)
    {
        float _790 = _722 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _752 = _790;
    }
    float _792 = _752;
    bool _794 = _764 != 0.0;
    bool _796 = isnan(_764);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    float _804 = rint(_764);
    float _806 = precise::max(_804, 0.0);
    uint _808 = uint(_806);
    uint _810 = clamp(_808, 0u, 65535u);
    float _812 = _792;
    if (!_802)
    {
        float _814 = _732 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _812 = _814;
    }
    float _816 = _812;
    if (!_802)
    {
        float _818 = _736 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _788 = _818;
    }
    float _820 = _788;
    if (!_802)
    {
        float _822 = _738 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _782 = _822;
    }
    float _824 = _782;
    float _826 = 0.0 + _816;
    float _828 = precise::clamp(_826, 0.0, 1.0);
    float _830 = fma(_508, _828, _820);
    float _832 = -_448;
    float _834 = fma(_832, _828, _824);
    float _836 = fma(_448, _828, _824);
    float3 _2500 = float3(_824, _830, float(int(_810)));
    float3 _2502 = select(_2500, float3(0.0), isnan(_2500));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2502.xy, uint(rint(_2502.z)), _828);
    float3 _2511 = float3(_834, _830, float(int(_810)));
    float3 _2513 = select(_2511, float3(0.0), isnan(_2511));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2513.xy, uint(rint(_2513.z)), _828);
    float3 _2522 = float3(_836, _830, float(int(_810)));
    float3 _2524 = select(_2522, float3(0.0), isnan(_2522));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2524.xy, uint(rint(_2524.z)), _828);
    float3 _2533 = float3(_836, _820, float(int(_810)));
    float3 _2535 = select(_2533, float3(0.0), isnan(_2533));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2535.xy, uint(rint(_2535.z)), _828);
    float3 _2544 = float3(_824, _820, float(int(_810)));
    float3 _2546 = select(_2544, float3(0.0), isnan(_2544));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2546.xy, uint(rint(_2546.z)), _828);
    float _848 = -_508;
    float _850 = fma(_848, _828, _820);
    float3 _2561 = float3(_834, _820, float(int(_810)));
    float3 _2563 = select(_2561, float3(0.0), isnan(_2561));
    float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2563.xy, uint(rint(_2563.z)), _828);
    float3 _2572 = float3(_836, _850, float(int(_810)));
    float3 _2574 = select(_2572, float3(0.0), isnan(_2572));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2574.xy, uint(rint(_2574.z)), _828);
    float3 _2583 = float3(_824, _850, float(int(_810)));
    float3 _2585 = select(_2583, float3(0.0), isnan(_2583));
    float _856 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2585.xy, uint(rint(_2585.z)), _828);
    float3 _2594 = float3(_834, _850, float(int(_810)));
    float3 _2596 = select(_2594, float3(0.0), isnan(_2594));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2596.xy, uint(rint(_2596.z)), _828);
    float2 _2602 = float2(_56, _58);
    float _860 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2602, float2(0.0), isnan(_2602))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2602, float2(0.0), isnan(_2602))).x;
    float _862 = _646 + _616;
    float _864 = -_140;
    float _866 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _868 = _864 + _866;
    float _870 = -_140;
    float _872 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _874 = _870 + _872;
    float _876 = _868 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _878 = precise::clamp(_876, 0.0, 1.0);
    float _880 = _862 + _624;
    float _882 = _880 + _626;
    float _884 = _652 + _628;
    float _886 = _884 + _636;
    float _888 = _886 + _650;
    float _890 = _888 + _638;
    float _892 = _890 + _654;
    float _894 = _892 + _656;
    float _896 = _894 + _658;
    float _898 = fma(_882, 0.111111111938953399658203125, _878);
    float _900 = _896 + _660;
    float _902 = _900 * 0.111111111938953399658203125;
    float _904 = _842 + _838;
    float _906 = _904 + _840;
    float _908 = _906 + _844;
    float _910 = _908 + _846;
    float _912 = _910 + _852;
    float _914 = _912 + _854;
    float _916 = _914 + _856;
    float _918 = _916 + _858;
    float _920 = _918 * 0.111111111938953399658203125;
    float _922 = _920 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _924 = fma(_902, (*spvDescriptorSet0.fp_c3)._m0[49].z, _922);
    float _926 = _874 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _928 = precise::clamp(_926, 0.0, 1.0);
    float _930 = _924 + _928;
    out.m_49.x = _860;
    out.m_49.y = _898;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _930;
    return out;
}

