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
    bool _272 = false;
    bool _270 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _871 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_871, float2(0.0), isnan(_871)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _888 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_888, float2(0.0), isnan(_888))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_888, float2(0.0), isnan(_888))).x;
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
    float _166 = -_160;
    float _168 = fma(_150, _152, _166);
    float _170 = _150 * _156;
    float _172 = _164 * _164;
    float _174 = -_70;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _178 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[46].z, _176);
    float _180 = -_170;
    float _182 = fma(_146, _154, _180);
    float _184 = fma(_168, _168, _172);
    float _186 = _178 * _72;
    float _188 = -_178;
    bool _192 = _188 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _194 = fma(_182, _182, _184);
    float _196 = -_178;
    bool _198 = _196 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _200 = !_192;
    uint _203 = uint(_200 ? 0 : 1);
    float _205 = rsqrt(_194);
    uint _207 = 2u;
    if (!_192)
    {
        _207 = 1u;
    }
    uint _209 = _207;
    uint _211 = _209;
    if (!_198)
    {
        _211 = _203;
    }
    uint _213 = _211;
    uint _215 = min(_213, 2u);
    float _217 = _164 * _205;
    float _219 = _168 * _205;
    int _222 = int(_215) << 2;
    float _224 = _182 * _205;
    float _226 = _217 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _228 = uint(int(uint(_222) >> uint(2)));
    uint _230 = uint(int(uint(int(_228)) >> uint(2)));
    int _232 = int(_228) & 3;
    float _234 = (*spvDescriptorSet0.fp_c1)._m0[int(_230)][_232];
    float _236 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[35].x, _226);
    float _238 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[35].z, _236);
    float _240 = abs(_238);
    float _242 = -_240;
    float _244 = _242 + 1.0;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _178 * _74;
    float _250 = abs(_246);
    float _252 = log2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _256 = exp2(_254);
    float _258 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _260 = fma(_219, _258, _248);
    float _262 = fma(_217, _258, _186);
    float _264 = fma(_224, _258, _178);
    bool _266 = as_type<int>(_234) == 1216;
    if (!_266)
    {
        bool _268 = as_type<int>(_234) == 1488;
        _270 = _268;
        if (!_270)
        {
            _272 = true;
        }
    }
    float _306;
    float _308;
    float _310;
    float _312;
    if (!_270)
    {
        if (!_272)
        {
            float _274 = _262 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _276 = _262 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _278 = _262 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _280 = _262 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _282 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].x, _274);
            float _284 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].x, _276);
            float _286 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].x, _278);
            float _288 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].x, _280);
            float _290 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].z, _282);
            float _292 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[1].z, _284);
            float _294 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[2].z, _286);
            float _296 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[3].z, _288);
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _306 = _304;
            _308 = _302;
            _310 = _298;
            _312 = _300;
        }
    }
    if ((false || _272) || _270)
    {
        if ((!_272) || _270)
        {
            _270 = false;
            float _314 = _262 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _316 = _262 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _318 = _262 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _320 = _262 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _322 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[4].x, _314);
            float _324 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[5].x, _316);
            float _326 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[6].x, _318);
            float _328 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[7].x, _320);
            float _330 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[4].z, _322);
            float _332 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[5].z, _324);
            float _334 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[6].z, _326);
            float _336 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[7].z, _328);
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _306 = _344;
            _308 = _342;
            _310 = _338;
            _312 = _340;
        }
        if (false || _272)
        {
            _272 = false;
            float _346 = _262 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _348 = _262 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _350 = _262 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _352 = _262 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _354 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[8].x, _346);
            float _356 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[9].x, _348);
            float _358 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[10].x, _350);
            float _360 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[11].x, _352);
            float _362 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[8].z, _354);
            float _364 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[9].z, _356);
            float _366 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[10].z, _358);
            float _368 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[11].z, _360);
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _306 = _376;
            _308 = _374;
            _310 = _370;
            _312 = _372;
        }
    }
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float _386 = 1.0 / _378;
    float _388 = float(int(_213));
    float _390 = rint(_388);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    uint _396 = clamp(_394, 0u, 65535u);
    float _398 = _386 * _380;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _386 * _382;
    float _404 = _386 * _384;
    float _406 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _400;
    float _408 = _406 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _410 = _406 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _412 = fma(_408, -0.5, _402);
    float _414 = fma(_410, 0.5, _404);
    float3 _1529 = float3(_412, _414, float(int(_396)));
    float3 _1533 = select(_1529, float3(0.0), isnan(_1529));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1533.xy, uint(rint(_1533.z)), _400);
    float _418 = -_186;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _422 = -_248;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _426 = -_178;
    float _428 = _426 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _430 = _186 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _432 = _420 * _420;
    float _434 = -_178;
    float _436 = _434 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _438 = _186 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _440 = _186 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _442 = fma(_424, _424, _432);
    float _444 = -_248;
    float _446 = _444 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _448 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[19].x, _438);
    float _450 = _186 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _452 = fma(_436, _436, _442);
    float _454 = -_186;
    float _456 = _454 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _458 = _186 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _460 = _186 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _462 = _186 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _464 = _186 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _466 = sqrt(_452);
    float _468 = _456 * _456;
    float _470 = _186 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _472 = _186 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _474 = fma(_446, _446, _468);
    float _476 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[22].x, _430);
    float _478 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[23].x, _440);
    float _480 = _186 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _482 = fma(_428, _428, _474);
    float _484 = _186 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _486 = _186 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _488 = _186 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _490 = _186 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _492 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[19].z, _448);
    float _494 = sqrt(_482);
    bool _496 = _466 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _498 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[21].x, _450);
    bool _500 = _466 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _502 = _186 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _504 = !_496;
    int _506 = _504 ? 0 : 1;
    float _508 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[22].z, _476);
    float _510 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[16].x, _458);
    float _512 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[24].x, _502);
    float _514 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[17].x, _460);
    float _516 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[18].x, _462);
    float _518 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[25].x, _484);
    float _520 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[26].x, _464);
    float _522 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[27].x, _470);
    int _524 = 2;
    if (!_496)
    {
        _524 = 1;
    }
    int _526 = _524;
    float _528 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[28].x, _472);
    int _530 = _526;
    if (!_500)
    {
        _530 = _506;
    }
    int _532 = _530;
    float _534 = _186 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _536 = _494 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _538 = _186 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _540 = float(_532);
    float _542 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[20].x, _534);
    bool _544 = _494 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _546 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[29].x, _480);
    float _548 = precise::min(_540, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _550 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[30].x, _486);
    bool _552 = !_536;
    int _554 = _552 ? 0 : 1;
    float _556 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[31].x, _488);
    bool _558 = _548 != 1.0;
    bool _560 = isnan(_548);
    bool _562 = _558 || _560;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    float _568 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[32].x, _490);
    float _570 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[33].x, _538);
    int _572 = 2;
    if (!_536)
    {
        _572 = 1;
    }
    int _574 = _572;
    float _576 = _492 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _578 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[20].z, _542);
    int _580 = _574;
    float _582 = _576;
    if (!_544)
    {
        _580 = _554;
    }
    int _584 = _580;
    float _586 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[21].z, _498);
    float _588 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[23].z, _478);
    float _590 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[18].z, _516);
    float _592 = float(_584);
    float _594 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[28].z, _528);
    if (_566)
    {
        float _596 = _508 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _582 = _596;
    }
    float _598 = _582;
    float _600 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[24].z, _512);
    float _602 = _578 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _604 = precise::min(_592, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _606 = _586 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _608 = _602;
    float _610 = _606;
    float _612 = _598;
    if (_566)
    {
        float _614 = _588 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _608 = _614;
    }
    float _616 = _608;
    float _618 = _616;
    if (_566)
    {
        float _620 = _600 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _610 = _620;
    }
    float _622 = _610;
    bool _624 = _548 != 0.0;
    bool _626 = isnan(_548);
    bool _628 = _624 || _626;
    bool _630 = isnan(0.0);
    bool _632 = _628 || _630;
    float _634 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[31].z, _556);
    bool _636 = _604 != 1.0;
    bool _638 = isnan(_604);
    bool _640 = _636 || _638;
    bool _642 = isnan(1.0);
    bool _644 = _640 || _642;
    float _646 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[25].z, _518);
    bool _648 = _604 != 0.0;
    bool _650 = isnan(_604);
    bool _652 = _648 || _650;
    bool _654 = isnan(0.0);
    bool _656 = _652 || _654;
    float _658 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[29].z, _546);
    float _660 = _594 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _662 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[32].z, _568);
    float _664 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[30].z, _550);
    float _666 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[26].z, _520);
    float _668 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[33].z, _570);
    float _670 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[16].z, _510);
    float _672 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _674 = _622;
    float _676 = _660;
    if (!_632)
    {
        float _678 = _590 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _674 = _678;
    }
    float _680 = _674;
    float _682 = _658 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _684 = _682;
    if (_644)
    {
        float _686 = _634 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _676 = _686;
    }
    float _688 = _676;
    float _690 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[27].z, _522);
    float _692 = _688;
    if (!_656)
    {
        float _694 = _646 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _692 = _694;
    }
    float _696 = _692;
    float _698 = 0.0 + _680;
    float _700 = precise::clamp(_698, 0.0, 1.0);
    if (_644)
    {
        float _702 = _662 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _684 = _702;
    }
    float _704 = _684;
    float _706 = _664 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _708 = _704;
    float _710 = _706;
    if (!_656)
    {
        float _712 = _666 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _708 = _712;
    }
    float _714 = _708;
    float _716 = fma(_408, 0.5, _402);
    if (_644)
    {
        float _718 = _668 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _710 = _718;
    }
    float _720 = _710;
    float _722 = _720;
    if (!_632)
    {
        float _724 = _670 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _612 = _724;
    }
    float _726 = _612;
    float _728 = rint(_548);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    uint _734 = clamp(_732, 0u, 65535u);
    float _736 = _700 * _672;
    if (!_656)
    {
        float _738 = _690 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _722 = _738;
    }
    float _740 = _722;
    float _742 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[17].z, _514);
    float _744 = fma(_410, -0.5, _404);
    float _746 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _748 = fma(_736, 0.5, _726);
    float _750 = 0.0 + _740;
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float _754 = fma(_736, -0.5, _726);
    if (!_632)
    {
        float _756 = _742 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _618 = _756;
    }
    float _758 = _618;
    float _760 = rint(_604);
    float _762 = precise::max(_760, 0.0);
    uint _764 = uint(_762);
    uint _766 = clamp(_764, 0u, 65535u);
    float _768 = _700 * _746;
    float _770 = _672 * _752;
    float _772 = _746 * _752;
    float _774 = fma(_768, 0.5, _758);
    float _776 = fma(_768, -0.5, _758);
    float _778 = fma(_770, 0.5, _696);
    float _780 = fma(_770, -0.5, _696);
    float _782 = fma(_772, 0.5, _714);
    float _784 = fma(_772, -0.5, _714);
    float3 _2208 = float3(_716, _414, float(int(_396)));
    float3 _2210 = select(_2208, float3(0.0), isnan(_2208));
    float _786 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2210.xy, uint(rint(_2210.z)), _400);
    float3 _2219 = float3(_716, _744, float(int(_396)));
    float3 _2221 = select(_2219, float3(0.0), isnan(_2219));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2221.xy, uint(rint(_2221.z)), _400);
    float3 _2230 = float3(_412, _744, float(int(_396)));
    float3 _2232 = select(_2230, float3(0.0), isnan(_2230));
    float _790 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2232.xy, uint(rint(_2232.z)), _400);
    float3 _2241 = float3(_754, _774, float(int(_734)));
    float3 _2243 = select(_2241, float3(0.0), isnan(_2241));
    float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2243.xy, uint(rint(_2243.z)), _700);
    float3 _2252 = float3(_748, _774, float(int(_734)));
    float3 _2254 = select(_2252, float3(0.0), isnan(_2252));
    float _794 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2254.xy, uint(rint(_2254.z)), _700);
    float3 _2263 = float3(_748, _776, float(int(_734)));
    float3 _2265 = select(_2263, float3(0.0), isnan(_2263));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2265.xy, uint(rint(_2265.z)), _700);
    float3 _2274 = float3(_754, _776, float(int(_734)));
    float3 _2276 = select(_2274, float3(0.0), isnan(_2274));
    float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2276.xy, uint(rint(_2276.z)), _700);
    float3 _2285 = float3(_780, _782, float(int(_766)));
    float3 _2287 = select(_2285, float3(0.0), isnan(_2285));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2287.xy, uint(rint(_2287.z)), _752);
    float3 _2296 = float3(_778, _782, float(int(_766)));
    float3 _2298 = select(_2296, float3(0.0), isnan(_2296));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2298.xy, uint(rint(_2298.z)), _752);
    float3 _2307 = float3(_778, _784, float(int(_766)));
    float3 _2309 = select(_2307, float3(0.0), isnan(_2307));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2309.xy, uint(rint(_2309.z)), _752);
    float3 _2318 = float3(_780, _784, float(int(_766)));
    float3 _2320 = select(_2318, float3(0.0), isnan(_2318));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2320.xy, uint(rint(_2320.z)), _752);
    float2 _2326 = float2(_56, _58);
    float _808 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2326, float2(0.0), isnan(_2326))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2326, float2(0.0), isnan(_2326))).x;
    float _810 = -_178;
    float _812 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _814 = _810 + _812;
    float _816 = -_178;
    float _818 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _820 = _816 + _818;
    float _822 = _814 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _824 = precise::clamp(_822, 0.0, 1.0);
    float _826 = _786 + _416;
    float _828 = _826 + _788;
    float _830 = _828 + _790;
    float _832 = _794 + _792;
    float _834 = fma(_830, 0.25, _824);
    float _836 = _832 + _796;
    float _838 = _802 + _800;
    float _840 = _836 + _798;
    float _842 = _840 * 0.25;
    float _844 = _838 + _804;
    float _846 = _844 + _806;
    float _848 = _846 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _850 = _848 * 0.25;
    float _852 = fma(_842, (*spvDescriptorSet0.fp_c3)._m0[49].z, _850);
    float _854 = _820 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _856 = precise::clamp(_854, 0.0, 1.0);
    float _858 = _852 + _856;
    out.m_49.x = _808;
    out.m_49.y = _834;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _858;
    return out;
}

