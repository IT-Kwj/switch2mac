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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_48 [[user(locn1), center_no_perspective]];
    float4 m_46 [[user(locn2), center_no_perspective]];
    float4 m_42 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _284 = false;
    bool _282 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _902 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_902, float2(0.0), isnan(_902)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _919 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_919, float2(0.0), isnan(_919))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_919, float2(0.0), isnan(_919))).x;
    float _74 = in.m_44.y;
    float _76 = in.m_46.y;
    float _78 = in.m_44.x;
    float _80 = in.m_48.y;
    float _82 = in.m_46.x;
    float _84 = in.m_48.x;
    float _86 = -_66;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_68;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _74 * _90;
    float _100 = _78 * _90;
    float _102 = -_98;
    float _104 = fma(_96, _76, _102);
    float _106 = -_70;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[46].z, _108);
    float _112 = -_100;
    float _114 = fma(_96, _82, _112);
    float _116 = -_90;
    float _118 = _116 + _96;
    float _120 = _104 * _104;
    float _122 = -_98;
    float _124 = fma(_110, _80, _122);
    float _126 = -_100;
    float _128 = fma(_110, _84, _126);
    float _130 = -_90;
    float _132 = _130 + _110;
    float _134 = fma(_114, _114, _120);
    float _136 = _124 * _124;
    float _138 = -_72;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _142 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[46].z, _140);
    float _144 = fma(_118, _118, _134);
    float _146 = fma(_128, _128, _136);
    float _148 = _142 * _74;
    float _150 = -_142;
    bool _154 = _150 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _156 = _142 * _78;
    float _158 = fma(_132, _132, _146);
    float _160 = rsqrt(_144);
    float _162 = -_142;
    bool _164 = _162 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _166 = -_142;
    bool _168 = _166 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _170 = rsqrt(_158);
    int _173 = 2;
    if (!_154)
    {
        _173 = 1;
    }
    int _175 = _173;
    float _177 = _114 * _160;
    float _179 = _118 * _160;
    float _181 = _104 * _160;
    float _183 = _132 * _170;
    float _185 = _124 * _170;
    float _187 = _128 * _170;
    float _189 = _177 * _183;
    float _191 = _179 * _185;
    float _193 = _181 * _187;
    float _195 = -_189;
    float _197 = fma(_179, _187, _195);
    float _199 = -_191;
    float _201 = fma(_181, _183, _199);
    float _203 = -_193;
    float _205 = fma(_177, _185, _203);
    float _207 = _197 * _197;
    float _209 = fma(_201, _201, _207);
    float _211 = fma(_205, _205, _209);
    bool _213 = !_154;
    int _215 = _213 ? 0 : 1;
    int _217 = _175;
    if (!_164)
    {
        _217 = _215;
    }
    int _219 = _217;
    float _221 = rsqrt(_211);
    int _223 = _219 + 1;
    uint _226 = uint(_223);
    if (!_168)
    {
        _226 = uint(_219);
    }
    uint _228 = _226;
    uint _230 = min(_228, 2u);
    int _232 = int(_230) << 2;
    float _234 = _197 * _221;
    float _236 = _201 * _221;
    float _238 = _205 * _221;
    float _240 = _234 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _242 = uint(int(uint(_232) >> uint(2)));
    uint _244 = uint(int(uint(int(_242)) >> uint(2)));
    int _246 = int(_242) & 3;
    float _248 = (*spvDescriptorSet0.fp_c1)._m0[int(_244)][_246];
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].x, _240);
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].z, _250);
    float _254 = abs(_252);
    float _256 = -_254;
    float _258 = _256 + 1.0;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = abs(_260);
    float _264 = log2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _268 = exp2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _272 = fma(_234, _270, _148);
    float _274 = fma(_236, _270, _156);
    float _276 = fma(_238, _270, _142);
    bool _278 = as_type<int>(_248) == 1264;
    if (!_278)
    {
        bool _280 = as_type<int>(_248) == 1536;
        _282 = _280;
        if (!_282)
        {
            _284 = true;
        }
    }
    float _318;
    float _320;
    float _322;
    float _324;
    if (!_282)
    {
        if (!_284)
        {
            float _286 = _272 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _288 = _272 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _290 = _272 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _292 = _272 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _294 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
            float _296 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].x, _288);
            float _298 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].z, _294);
            float _304 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].z, _296);
            float _306 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].z, _300);
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _318 = _316;
            _320 = _314;
            _322 = _312;
            _324 = _310;
        }
    }
    if ((false || _284) || _282)
    {
        if ((!_284) || _282)
        {
            _282 = false;
            float _326 = _272 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _328 = _272 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _330 = _272 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _272 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _334 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].x, _326);
            float _336 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].x, _328);
            float _338 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].z, _334);
            float _344 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].z, _336);
            float _346 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].z, _340);
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _318 = _356;
            _320 = _354;
            _322 = _352;
            _324 = _350;
        }
        if (false || _284)
        {
            _284 = false;
            float _358 = _272 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _360 = _272 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _362 = _272 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _272 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _366 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].x, _358);
            float _368 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].x, _360);
            float _370 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].z, _366);
            float _376 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].z, _368);
            float _378 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _318 = _388;
            _320 = _386;
            _322 = _384;
            _324 = _382;
        }
    }
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _148 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _400 = -_148;
    float _402 = _400 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _404 = -_156;
    float _406 = _404 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _408 = -_148;
    float _410 = _408 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _412 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[20].x, _398);
    float _414 = _402 * _402;
    float2 _1558 = float2(_58, _60);
    float2 _418 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1558, float2(0.0), isnan(_1558))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1558, float2(0.0), isnan(_1558))).xy;
    float _420 = _418.x;
    float _422 = _418.y;
    float _424 = -_156;
    float _426 = _424 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _428 = _410 * _410;
    float _430 = fma(_406, _406, _414);
    float _432 = -_142;
    float _434 = _432 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _436 = 1.0 / _390;
    float _438 = fma(_426, _426, _428);
    float _440 = -_142;
    float _442 = _440 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _444 = fma(_434, _434, _430);
    float _446 = float(int(_228));
    float _448 = _148 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _450 = fma(_442, _442, _438);
    float _452 = _148 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _454 = sqrt(_444);
    float _456 = _148 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _458 = _148 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _460 = _148 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _462 = _148 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _464 = _148 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _466 = _148 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _468 = _436 * _392;
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = sqrt(_450);
    float _474 = _436 * _394;
    float _476 = _148 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _478 = _148 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _480 = _148 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _482 = _148 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _484 = _148 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _486 = _148 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _488 = _454 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _490 = _148 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _492 = _454 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _494 = _148 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _496 = rint(_446);
    float _498 = precise::max(_496, 0.0);
    uint _500 = uint(_498);
    uint _502 = clamp(_500, 0u, 65535u);
    bool _504 = !_488;
    int _506 = _504 ? 0 : 1;
    float _508 = _148 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _510 = _436 * _396;
    bool _512 = _472 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _514 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[19].x, _448);
    bool _516 = _472 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _518 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[22].x, _452);
    float _520 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[23].x, _456);
    int _522 = 2;
    if (!_488)
    {
        _522 = 1;
    }
    int _524 = _522;
    float _526 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[21].x, _458);
    int _528 = _524;
    if (!_492)
    {
        _528 = _506;
    }
    int _530 = _528;
    float _532 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _470;
    float _534 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[24].x, _460);
    float _536 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[16].x, _462);
    float _538 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[17].x, _464);
    float _540 = _532 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _542 = _532 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _544 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[18].x, _466);
    float _546 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[25].x, _476);
    float _548 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[26].x, _478);
    float _550 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[27].x, _480);
    float _552 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[28].x, _482);
    float _554 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[29].x, _484);
    float _556 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[30].x, _486);
    float _558 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[31].x, _490);
    float _560 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[32].x, _494);
    bool _562 = !_512;
    int _564 = _562 ? 0 : 1;
    float _566 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[33].x, _508);
    float _568 = fma(_540, -0.5, _510);
    float _570 = fma(_542, 0.5, _474);
    int _572 = 2;
    if (!_512)
    {
        _572 = 1;
    }
    int _574 = _572;
    int _576 = _574;
    if (!_516)
    {
        _576 = _564;
    }
    int _578 = _576;
    float3 _1882 = float3(_568, _570, float(int(_502)));
    float3 _1886 = select(_1882, float3(0.0), isnan(_1882));
    float _580 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1886.xy, uint(rint(_1886.z)), _470);
    float _582 = float(_530);
    float _584 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[19].z, _514);
    float _586 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[20].z, _412);
    float _588 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[21].z, _526);
    float _590 = precise::min(_582, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _592 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[22].z, _518);
    float _594 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[23].z, _520);
    float _596 = float(_578);
    float _598 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[24].z, _534);
    bool _600 = _590 != 1.0;
    bool _602 = isnan(_590);
    bool _604 = _600 || _602;
    bool _606 = isnan(1.0);
    bool _608 = _604 || _606;
    float _610 = _584 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _612 = _586 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _614 = _588 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _616 = precise::min(_596, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _618 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[18].z, _544);
    float _620 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[30].z, _556);
    float _622 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[33].z, _566);
    bool _624 = _616 != 1.0;
    bool _626 = isnan(_616);
    bool _628 = _624 || _626;
    bool _630 = isnan(1.0);
    bool _632 = _628 || _630;
    float _634 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[16].z, _536);
    bool _636 = _616 != 0.0;
    bool _638 = isnan(_616);
    bool _640 = _636 || _638;
    bool _642 = isnan(0.0);
    bool _644 = _640 || _642;
    float _646 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[27].z, _550);
    float _648 = _620 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _650 = _610;
    float _652 = _612;
    float _654 = _614;
    float _656 = _648;
    if (_608)
    {
        float _658 = _592 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _650 = _658;
    }
    float _660 = _650;
    float _662 = _660;
    if (_608)
    {
        float _664 = _594 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _652 = _664;
    }
    float _666 = _652;
    float _668 = _666;
    if (_608)
    {
        float _670 = _598 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _654 = _670;
    }
    float _672 = _654;
    bool _674 = _590 != 0.0;
    bool _676 = isnan(_590);
    bool _678 = _674 || _676;
    bool _680 = isnan(0.0);
    bool _682 = _678 || _680;
    float _684 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[17].z, _538);
    float _686 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[29].z, _554);
    float _688 = fma(_540, 0.5, _510);
    float _690 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[28].z, _552);
    float _692 = _672;
    if (_632)
    {
        float _694 = _622 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _656 = _694;
    }
    float _696 = _656;
    float _698 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _700 = _696;
    if (!_644)
    {
        float _702 = _646 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _700 = _702;
    }
    float _704 = _700;
    float _706 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[32].z, _560);
    float _708 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _710 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[31].z, _558);
    float _712 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[26].z, _548);
    float _714 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[25].z, _546);
    if (!_682)
    {
        float _716 = _618 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _692 = _716;
    }
    float _718 = _692;
    if (!_682)
    {
        float _720 = _634 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _662 = _720;
    }
    float _722 = _662;
    if (!_682)
    {
        float _724 = _684 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _668 = _724;
    }
    float _726 = _668;
    float _728 = 0.0 + _704;
    float _730 = precise::clamp(_728, 0.0, 1.0);
    float _732 = 0.0 + _718;
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float _736 = _686 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _738 = _690 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _740 = _736;
    float _742 = _738;
    if (_632)
    {
        float _744 = _706 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _740 = _744;
    }
    float _746 = _740;
    float _748 = _734 * _698;
    float _750 = _734 * _708;
    float _752 = _746;
    if (_632)
    {
        float _754 = _710 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _742 = _754;
    }
    float _756 = _742;
    float _758 = _756;
    if (!_644)
    {
        float _760 = _712 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _752 = _760;
    }
    float _762 = _752;
    float _764 = fma(_542, -0.5, _474);
    if (!_644)
    {
        float _766 = _714 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _758 = _766;
    }
    float _768 = _758;
    float _770 = fma(_748, 0.5, _722);
    float _772 = _698 * _730;
    float _774 = fma(_748, -0.5, _722);
    float _776 = fma(_750, 0.5, _726);
    float _778 = fma(_750, -0.5, _726);
    float _780 = fma(_772, 0.5, _768);
    float _782 = fma(_772, -0.5, _768);
    float _784 = rint(_590);
    float _786 = precise::max(_784, 0.0);
    uint _788 = uint(_786);
    uint _790 = clamp(_788, 0u, 65535u);
    float _792 = _708 * _730;
    float _794 = rint(_616);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    uint _800 = clamp(_798, 0u, 65535u);
    float _802 = fma(_792, 0.5, _762);
    float _804 = fma(_792, -0.5, _762);
    float3 _2267 = float3(_688, _570, float(int(_502)));
    float3 _2269 = select(_2267, float3(0.0), isnan(_2267));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2269.xy, uint(rint(_2269.z)), _470);
    float _808 = fma(_420, 2.0, -1.0);
    float _810 = fma(_422, 2.0, -1.0);
    float _812 = _808 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _814 = _810 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _816 = fma(_812, 2.0, _58);
    float _818 = fma(_814, 2.0, _60);
    float3 _2299 = float3(_688, _764, float(int(_502)));
    float3 _2301 = select(_2299, float3(0.0), isnan(_2299));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2301.xy, uint(rint(_2301.z)), _470);
    float3 _2310 = float3(_568, _764, float(int(_502)));
    float3 _2312 = select(_2310, float3(0.0), isnan(_2310));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2312.xy, uint(rint(_2312.z)), _470);
    float3 _2321 = float3(_774, _776, float(int(_790)));
    float3 _2323 = select(_2321, float3(0.0), isnan(_2321));
    float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2323.xy, uint(rint(_2323.z)), _734);
    float3 _2332 = float3(_770, _776, float(int(_790)));
    float3 _2334 = select(_2332, float3(0.0), isnan(_2332));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2334.xy, uint(rint(_2334.z)), _734);
    float3 _2343 = float3(_770, _778, float(int(_790)));
    float3 _2345 = select(_2343, float3(0.0), isnan(_2343));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2345.xy, uint(rint(_2345.z)), _734);
    float3 _2354 = float3(_782, _802, float(int(_800)));
    float3 _2356 = select(_2354, float3(0.0), isnan(_2354));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2356.xy, uint(rint(_2356.z)), _730);
    float3 _2365 = float3(_780, _802, float(int(_800)));
    float3 _2367 = select(_2365, float3(0.0), isnan(_2365));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2367.xy, uint(rint(_2367.z)), _730);
    float3 _2376 = float3(_780, _804, float(int(_800)));
    float3 _2378 = select(_2376, float3(0.0), isnan(_2376));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2378.xy, uint(rint(_2378.z)), _730);
    float3 _2387 = float3(_774, _778, float(int(_790)));
    float3 _2389 = select(_2387, float3(0.0), isnan(_2387));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2389.xy, uint(rint(_2389.z)), _734);
    float3 _2398 = float3(_782, _804, float(int(_800)));
    float3 _2400 = select(_2398, float3(0.0), isnan(_2398));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2400.xy, uint(rint(_2400.z)), _730);
    float2 _2406 = float2(_816, _818);
    float _840 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2406, float2(0.0), isnan(_2406))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2406, float2(0.0), isnan(_2406))).x;
    float _842 = -_142;
    float _844 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _846 = _842 + _844;
    float _848 = -_142;
    float _850 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _852 = _848 + _850;
    float _854 = _846 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _856 = precise::clamp(_854, 0.0, 1.0);
    float _858 = _806 + _580;
    float _860 = _858 + _820;
    float _862 = _826 + _824;
    float _864 = _860 + _822;
    float _866 = _832 + _830;
    float _868 = _862 + _828;
    float _870 = fma(_864, 0.25, _856);
    float _872 = _866 + _834;
    float _874 = _868 + _836;
    float _876 = _872 + _838;
    float _878 = _874 * 0.25;
    float _880 = _876 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _882 = _880 * 0.25;
    float _884 = fma(_878, (*spvDescriptorSet0.fp_c3)._m0[49].z, _882);
    float _886 = _852 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _888 = precise::clamp(_886, 0.0, 1.0);
    float _890 = _884 + _888;
    out.m_51.x = _840;
    out.m_51.y = _870;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _890;
    return out;
}

