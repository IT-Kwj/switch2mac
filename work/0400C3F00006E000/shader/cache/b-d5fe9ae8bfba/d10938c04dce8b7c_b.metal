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
    float2 _881 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_881, float2(0.0), isnan(_881)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _898 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_898, float2(0.0), isnan(_898))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_898, float2(0.0), isnan(_898))).x;
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
    float _136 = fma(_116, _116, _132);
    float _138 = fma(_126, _126, _134);
    float _140 = fma(_130, _130, _138);
    float _142 = rsqrt(_136);
    float _144 = rsqrt(_140);
    float _146 = -_70;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[46].z, _148);
    float _152 = _150 * _72;
    float _154 = -_150;
    bool _158 = _154 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _160 = _112 * _142;
    float _162 = _116 * _142;
    float _164 = _102 * _142;
    float _166 = -_150;
    bool _168 = _166 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _170 = -_150;
    bool _172 = _170 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _174 = _130 * _144;
    float _176 = _122 * _144;
    float _178 = _126 * _144;
    float _180 = _160 * _174;
    float _182 = _162 * _176;
    float _184 = _164 * _178;
    int _187 = 2;
    if (!_158)
    {
        _187 = 1;
    }
    int _189 = _187;
    float _191 = -_180;
    float _193 = fma(_162, _178, _191);
    float _195 = -_182;
    float _197 = fma(_164, _174, _195);
    float _199 = -_184;
    float _201 = fma(_160, _176, _199);
    float _203 = _193 * _193;
    float _205 = fma(_197, _197, _203);
    bool _207 = !_158;
    int _209 = _207 ? 0 : 1;
    float _211 = fma(_201, _201, _205);
    int _213 = _189;
    if (!_168)
    {
        _213 = _209;
    }
    int _215 = _213;
    int _217 = _215 + 1;
    float _219 = rsqrt(_211);
    uint _222 = uint(_217);
    if (!_172)
    {
        _222 = uint(_215);
    }
    uint _224 = _222;
    uint _226 = min(_224, 2u);
    int _228 = int(_226) << 2;
    float _230 = _193 * _219;
    float _232 = _197 * _219;
    float _234 = _201 * _219;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _238 = uint(int(uint(_228) >> uint(2)));
    uint _240 = uint(int(uint(int(_238)) >> uint(2)));
    int _242 = int(_238) & 3;
    float _244 = (*spvDescriptorSet0.fp_c1)._m0[int(_240)][_242];
    float _246 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].x, _236);
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].z, _246);
    float _250 = abs(_248);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _150 * _76;
    float _260 = abs(_256);
    float _262 = log2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _266 = exp2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _270 = fma(_232, _268, _258);
    float _272 = fma(_230, _268, _152);
    float _274 = fma(_234, _268, _150);
    bool _276 = as_type<int>(_244) == 1264;
    if (!_276)
    {
        bool _278 = as_type<int>(_244) == 1536;
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
    float _398 = float(int(_224));
    float _400 = rint(_398);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    uint _406 = clamp(_404, 0u, 65535u);
    float _408 = _396 * _390;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _396 * _392;
    float _414 = _396 * _394;
    float _416 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _410;
    float _418 = _416 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _420 = _416 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _422 = fma(_418, -0.5, _412);
    float _424 = fma(_420, 0.5, _414);
    float3 _1555 = float3(_422, _424, float(int(_406)));
    float3 _1559 = select(_1555, float3(0.0), isnan(_1555));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1559.xy, uint(rint(_1559.z)), _410);
    float _428 = -_152;
    float _430 = _428 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _432 = -_258;
    float _434 = _432 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _436 = -_150;
    float _438 = _436 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _440 = _152 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _442 = _430 * _430;
    float _444 = -_150;
    float _446 = _444 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _448 = _152 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _450 = _152 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _452 = fma(_434, _434, _442);
    float _454 = -_258;
    float _456 = _454 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _458 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[19].x, _448);
    float _460 = _152 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _462 = fma(_446, _446, _452);
    float _464 = -_152;
    float _466 = _464 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _468 = _152 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _470 = _152 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _472 = _152 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _474 = _152 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _476 = sqrt(_462);
    float _478 = _466 * _466;
    float _480 = _152 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _482 = _152 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _484 = fma(_456, _456, _478);
    float _486 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[22].x, _440);
    float _488 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[23].x, _450);
    float _490 = _152 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _492 = fma(_438, _438, _484);
    float _494 = _152 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _496 = _152 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _498 = _152 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _500 = _152 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _502 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[19].z, _458);
    float _504 = sqrt(_492);
    bool _506 = _476 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _508 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[21].x, _460);
    bool _510 = _476 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _512 = _152 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _514 = !_506;
    int _516 = _514 ? 0 : 1;
    float _518 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[22].z, _486);
    float _520 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[16].x, _468);
    float _522 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[24].x, _512);
    float _524 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[17].x, _470);
    float _526 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[18].x, _472);
    float _528 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[25].x, _494);
    float _530 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[26].x, _474);
    float _532 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[27].x, _480);
    int _534 = 2;
    if (!_506)
    {
        _534 = 1;
    }
    int _536 = _534;
    float _538 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[28].x, _482);
    int _540 = _536;
    if (!_510)
    {
        _540 = _516;
    }
    int _542 = _540;
    float _544 = _152 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _546 = _504 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _548 = _152 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _550 = float(_542);
    float _552 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[20].x, _544);
    bool _554 = _504 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _556 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[29].x, _490);
    float _558 = precise::min(_550, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _560 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[30].x, _496);
    bool _562 = !_546;
    int _564 = _562 ? 0 : 1;
    float _566 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[31].x, _498);
    bool _568 = _558 != 1.0;
    bool _570 = isnan(_558);
    bool _572 = _568 || _570;
    bool _574 = isnan(1.0);
    bool _576 = _572 || _574;
    float _578 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[32].x, _500);
    float _580 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[33].x, _548);
    int _582 = 2;
    if (!_546)
    {
        _582 = 1;
    }
    int _584 = _582;
    float _586 = _502 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _588 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[20].z, _552);
    int _590 = _584;
    float _592 = _586;
    if (!_554)
    {
        _590 = _564;
    }
    int _594 = _590;
    float _596 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[21].z, _508);
    float _598 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[23].z, _488);
    float _600 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[18].z, _526);
    float _602 = float(_594);
    float _604 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[28].z, _538);
    if (_576)
    {
        float _606 = _518 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _592 = _606;
    }
    float _608 = _592;
    float _610 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[24].z, _522);
    float _612 = _588 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _614 = precise::min(_602, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _616 = _596 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _618 = _612;
    float _620 = _616;
    float _622 = _608;
    if (_576)
    {
        float _624 = _598 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _618 = _624;
    }
    float _626 = _618;
    float _628 = _626;
    if (_576)
    {
        float _630 = _610 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _620 = _630;
    }
    float _632 = _620;
    bool _634 = _558 != 0.0;
    bool _636 = isnan(_558);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[31].z, _566);
    bool _646 = _614 != 1.0;
    bool _648 = isnan(_614);
    bool _650 = _646 || _648;
    bool _652 = isnan(1.0);
    bool _654 = _650 || _652;
    float _656 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[25].z, _528);
    bool _658 = _614 != 0.0;
    bool _660 = isnan(_614);
    bool _662 = _658 || _660;
    bool _664 = isnan(0.0);
    bool _666 = _662 || _664;
    float _668 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[29].z, _556);
    float _670 = _604 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _672 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[32].z, _578);
    float _674 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[30].z, _560);
    float _676 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[26].z, _530);
    float _678 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[33].z, _580);
    float _680 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[16].z, _520);
    float _682 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _684 = _632;
    float _686 = _670;
    if (!_642)
    {
        float _688 = _600 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _684 = _688;
    }
    float _690 = _684;
    float _692 = _668 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _694 = _692;
    if (_654)
    {
        float _696 = _644 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _686 = _696;
    }
    float _698 = _686;
    float _700 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[27].z, _532);
    float _702 = _698;
    if (!_666)
    {
        float _704 = _656 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _702 = _704;
    }
    float _706 = _702;
    float _708 = 0.0 + _690;
    float _710 = precise::clamp(_708, 0.0, 1.0);
    if (_654)
    {
        float _712 = _672 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _694 = _712;
    }
    float _714 = _694;
    float _716 = _674 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _718 = _714;
    float _720 = _716;
    if (!_666)
    {
        float _722 = _676 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _718 = _722;
    }
    float _724 = _718;
    float _726 = fma(_418, 0.5, _412);
    if (_654)
    {
        float _728 = _678 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _720 = _728;
    }
    float _730 = _720;
    float _732 = _730;
    if (!_642)
    {
        float _734 = _680 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _622 = _734;
    }
    float _736 = _622;
    float _738 = rint(_558);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    uint _744 = clamp(_742, 0u, 65535u);
    float _746 = _710 * _682;
    if (!_666)
    {
        float _748 = _700 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _732 = _748;
    }
    float _750 = _732;
    float _752 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[17].z, _524);
    float _754 = fma(_420, -0.5, _414);
    float _756 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _758 = fma(_746, 0.5, _736);
    float _760 = 0.0 + _750;
    float _762 = precise::clamp(_760, 0.0, 1.0);
    float _764 = fma(_746, -0.5, _736);
    if (!_642)
    {
        float _766 = _752 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _628 = _766;
    }
    float _768 = _628;
    float _770 = rint(_614);
    float _772 = precise::max(_770, 0.0);
    uint _774 = uint(_772);
    uint _776 = clamp(_774, 0u, 65535u);
    float _778 = _710 * _756;
    float _780 = _682 * _762;
    float _782 = _756 * _762;
    float _784 = fma(_778, 0.5, _768);
    float _786 = fma(_778, -0.5, _768);
    float _788 = fma(_780, 0.5, _706);
    float _790 = fma(_780, -0.5, _706);
    float _792 = fma(_782, 0.5, _724);
    float _794 = fma(_782, -0.5, _724);
    float3 _2234 = float3(_726, _424, float(int(_406)));
    float3 _2236 = select(_2234, float3(0.0), isnan(_2234));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2236.xy, uint(rint(_2236.z)), _410);
    float3 _2245 = float3(_726, _754, float(int(_406)));
    float3 _2247 = select(_2245, float3(0.0), isnan(_2245));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2247.xy, uint(rint(_2247.z)), _410);
    float3 _2256 = float3(_422, _754, float(int(_406)));
    float3 _2258 = select(_2256, float3(0.0), isnan(_2256));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2258.xy, uint(rint(_2258.z)), _410);
    float3 _2267 = float3(_764, _784, float(int(_744)));
    float3 _2269 = select(_2267, float3(0.0), isnan(_2267));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2269.xy, uint(rint(_2269.z)), _710);
    float3 _2278 = float3(_758, _784, float(int(_744)));
    float3 _2280 = select(_2278, float3(0.0), isnan(_2278));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2280.xy, uint(rint(_2280.z)), _710);
    float3 _2289 = float3(_758, _786, float(int(_744)));
    float3 _2291 = select(_2289, float3(0.0), isnan(_2289));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2291.xy, uint(rint(_2291.z)), _710);
    float3 _2300 = float3(_764, _786, float(int(_744)));
    float3 _2302 = select(_2300, float3(0.0), isnan(_2300));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2302.xy, uint(rint(_2302.z)), _710);
    float3 _2311 = float3(_790, _792, float(int(_776)));
    float3 _2313 = select(_2311, float3(0.0), isnan(_2311));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2313.xy, uint(rint(_2313.z)), _762);
    float3 _2322 = float3(_788, _792, float(int(_776)));
    float3 _2324 = select(_2322, float3(0.0), isnan(_2322));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2324.xy, uint(rint(_2324.z)), _762);
    float3 _2333 = float3(_788, _794, float(int(_776)));
    float3 _2335 = select(_2333, float3(0.0), isnan(_2333));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2335.xy, uint(rint(_2335.z)), _762);
    float3 _2344 = float3(_790, _794, float(int(_776)));
    float3 _2346 = select(_2344, float3(0.0), isnan(_2344));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2346.xy, uint(rint(_2346.z)), _762);
    float2 _2352 = float2(_56, _58);
    float _818 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2352, float2(0.0), isnan(_2352))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2352, float2(0.0), isnan(_2352))).x;
    float _820 = -_150;
    float _822 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _824 = _820 + _822;
    float _826 = -_150;
    float _828 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _830 = _826 + _828;
    float _832 = _824 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _834 = precise::clamp(_832, 0.0, 1.0);
    float _836 = _796 + _426;
    float _838 = _836 + _798;
    float _840 = _838 + _800;
    float _842 = _804 + _802;
    float _844 = fma(_840, 0.25, _834);
    float _846 = _842 + _806;
    float _848 = _812 + _810;
    float _850 = _846 + _808;
    float _852 = _850 * 0.25;
    float _854 = _848 + _814;
    float _856 = _854 + _816;
    float _858 = _856 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _860 = _858 * 0.25;
    float _862 = fma(_852, (*spvDescriptorSet0.fp_c3)._m0[49].z, _860);
    float _864 = _830 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _866 = precise::clamp(_864, 0.0, 1.0);
    float _868 = _862 + _866;
    out.m_49.x = _818;
    out.m_49.y = _844;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _868;
    return out;
}

