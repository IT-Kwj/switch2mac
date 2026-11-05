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
    texture2d_array<float> fp_t_tcb_12 [[id(6)]];
    sampler fp_t_tcb_12Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
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
    float2 _820 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_820, float2(0.0), isnan(_820)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _837 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_837, float2(0.0), isnan(_837))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_837, float2(0.0), isnan(_837))).x;
    float _74 = in.m_44.y;
    float _76 = in.m_44.x;
    float _78 = in.m_46.y;
    float _80 = in.m_48.y;
    float _82 = in.m_46.x;
    float _84 = in.m_48.x;
    float _86 = -_66;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_68;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = -_70;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = _74 * _90;
    float _106 = _76 * _90;
    float _108 = -_104;
    float _110 = fma(_96, _78, _108);
    float _112 = -_104;
    float _114 = fma(_102, _80, _112);
    float _116 = -_106;
    float _118 = fma(_96, _82, _116);
    float _120 = -_106;
    float _122 = fma(_102, _84, _120);
    float _124 = _110 * _110;
    float _126 = _114 * _114;
    float _128 = -_90;
    float _130 = _128 + _96;
    float _132 = -_90;
    float _134 = _132 + _102;
    float _136 = fma(_118, _118, _124);
    float _138 = fma(_122, _122, _126);
    float _140 = fma(_130, _130, _136);
    float _142 = fma(_134, _134, _138);
    float _144 = rsqrt(_140);
    float _146 = rsqrt(_142);
    float _148 = -_72;
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _152 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[46].z, _150);
    float _154 = _152 * _74;
    float _156 = -_152;
    bool _160 = _156 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _162 = _118 * _144;
    float _164 = _130 * _144;
    float _166 = _110 * _144;
    float _168 = -_152;
    bool _170 = _168 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _172 = -_152;
    bool _174 = _172 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _176 = _134 * _146;
    float _178 = _114 * _146;
    float _180 = _122 * _146;
    float _182 = _162 * _176;
    float _184 = _164 * _178;
    float _186 = _166 * _180;
    float _188 = -_182;
    float _190 = fma(_164, _180, _188);
    float _192 = -_184;
    float _194 = fma(_166, _176, _192);
    float _196 = -_186;
    float _198 = fma(_162, _178, _196);
    bool _200 = !_160;
    int _203 = _200 ? 0 : 1;
    float _205 = _190 * _190;
    float _207 = fma(_194, _194, _205);
    int _209 = 2;
    if (!_160)
    {
        _209 = 1;
    }
    int _211 = _209;
    float _213 = fma(_198, _198, _207);
    int _215 = _211;
    if (!_170)
    {
        _215 = _203;
    }
    int _217 = _215;
    int _219 = _217 + 1;
    float _221 = rsqrt(_213);
    uint _224 = uint(_219);
    if (!_174)
    {
        _224 = uint(_217);
    }
    uint _226 = _224;
    uint _228 = min(_226, 2u);
    int _230 = int(_228) << 2;
    float _232 = _190 * _221;
    float _234 = _194 * _221;
    float _236 = _198 * _221;
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _240 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].x, _238);
    uint _242 = uint(int(uint(_230) >> uint(2)));
    uint _244 = uint(int(uint(int(_242)) >> uint(2)));
    int _246 = int(_242) & 3;
    float _248 = (*spvDescriptorSet0.fp_c1)._m0[int(_244)][_246];
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].z, _240);
    float _252 = abs(_250);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _152 * _76;
    float _262 = abs(_258);
    float _264 = log2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _268 = exp2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _272 = fma(_234, _270, _260);
    float _274 = fma(_232, _270, _154);
    float _276 = fma(_236, _270, _152);
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
            float _286 = _274 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _288 = _274 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _290 = _274 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _292 = _274 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _294 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
            float _296 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].x, _288);
            float _298 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].z, _294);
            float _304 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].z, _296);
            float _306 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].z, _300);
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _318 = _316;
            _320 = _310;
            _322 = _314;
            _324 = _312;
        }
    }
    if ((false || _284) || _282)
    {
        if ((!_284) || _282)
        {
            _282 = false;
            float _326 = _274 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _328 = _274 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _330 = _274 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _274 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _334 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].x, _326);
            float _336 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].x, _328);
            float _338 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].z, _334);
            float _344 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].z, _336);
            float _346 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].z, _340);
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _318 = _356;
            _320 = _350;
            _322 = _354;
            _324 = _352;
        }
        if (false || _284)
        {
            _284 = false;
            float _358 = _274 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _360 = _274 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _362 = _274 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _274 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _366 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].x, _358);
            float _368 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].x, _360);
            float _370 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].z, _366);
            float _376 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].z, _368);
            float _378 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _318 = _388;
            _320 = _382;
            _322 = _386;
            _324 = _384;
        }
    }
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = -_154;
    float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _402 = -_260;
    float _404 = _402 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _406 = -_154;
    float _408 = _406 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _410 = _400 * _400;
    float _412 = -_152;
    float _414 = _412 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _416 = _408 * _408;
    float _418 = _154 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _420 = fma(_404, _404, _410);
    float _422 = -_260;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _426 = _154 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _428 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[33].x, _418);
    float _430 = fma(_414, _414, _420);
    float _432 = -_152;
    float _434 = _432 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _436 = fma(_424, _424, _416);
    float _438 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[33].z, _428);
    float _440 = _154 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _442 = fma(_434, _434, _436);
    float _444 = sqrt(_430);
    float _446 = _154 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _448 = _154 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _450 = _154 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _452 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[20].x, _426);
    float _454 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[19].x, _440);
    float _456 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[17].x, _446);
    float _458 = _154 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _460 = sqrt(_442);
    float _462 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[20].z, _452);
    float _464 = _154 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _466 = _154 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _468 = _154 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _470 = _154 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _472 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[19].z, _454);
    float _474 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[17].z, _456);
    bool _476 = _444 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _478 = 1.0 / _390;
    bool _480 = _444 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _482 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[16].x, _464);
    bool _484 = !_476;
    int _486 = _484 ? 0 : 1;
    float _488 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[29].x, _466);
    float _490 = float(int(_226));
    float _492 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[31].x, _468);
    bool _494 = _460 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _496 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[32].x, _470);
    bool _498 = _460 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _500 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[29].z, _488);
    bool _502 = !_494;
    int _504 = _502 ? 0 : 1;
    float _506 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[32].z, _496);
    int _508 = 2;
    int _510 = 2;
    if (!_476)
    {
        _508 = 1;
    }
    int _512 = _508;
    float _514 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[31].z, _492);
    int _516 = _512;
    if (!_480)
    {
        _516 = _486;
    }
    int _518 = _516;
    float _520 = _154 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _522 = _478 * _392;
    float _524 = _478 * _394;
    float _526 = precise::clamp(_524, 0.0, 1.0);
    float _528 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[16].z, _482);
    if (!_494)
    {
        _510 = 1;
    }
    int _530 = _510;
    float _532 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[21].x, _520);
    int _534 = _530;
    if (!_498)
    {
        _534 = _504;
    }
    int _536 = _534;
    float _538 = float(_518);
    float _540 = _154 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _542 = float(_536);
    float _544 = _154 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _546 = precise::min(_538, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _548 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[24].x, _540);
    float _550 = precise::min(_542, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _552 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[30].x, _544);
    bool _554 = _546 != 1.0;
    bool _556 = isnan(_546);
    bool _558 = _554 || _556;
    bool _560 = isnan(1.0);
    bool _562 = _558 || _560;
    float _564 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[21].z, _532);
    bool _566 = _550 != 1.0;
    bool _568 = isnan(_550);
    bool _570 = _566 || _568;
    bool _572 = isnan(1.0);
    bool _574 = _570 || _572;
    float _576 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[30].z, _552);
    float _578 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[24].z, _548);
    float _580 = _564 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _582 = _154 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _584 = _576 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    bool _586 = _546 != 0.0;
    bool _588 = isnan(_546);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    float _596 = _154 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _598 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[22].x, _582);
    bool _600 = _550 != 0.0;
    bool _602 = isnan(_550);
    bool _604 = _600 || _602;
    bool _606 = isnan(0.0);
    bool _608 = _604 || _606;
    float _610 = rint(_546);
    float _612 = precise::max(_610, 0.0);
    uint _614 = uint(_612);
    uint _616 = clamp(_614, 0u, 65535u);
    float _618 = _580;
    float _620 = _584;
    if (_562)
    {
        float _622 = _578 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _618 = _622;
    }
    float _624 = _618;
    float _626 = _154 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _628 = _624;
    if (_574)
    {
        float _630 = _438 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _620 = _630;
    }
    float _632 = _620;
    float _634 = _154 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _636 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[26].x, _458);
    float _638 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[23].x, _626);
    float _640 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[27].x, _596);
    float _642 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[18].x, _634);
    float _644 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[25].x, _448);
    float _646 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[28].x, _450);
    float _648 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[22].z, _598);
    float _650 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[23].z, _638);
    float _652 = _462 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _654 = _472 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _656 = _654;
    float _658 = _652;
    float _660 = _632;
    if (_562)
    {
        float _662 = _648 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _656 = _662;
    }
    float _664 = _656;
    float _666 = _664;
    if (_562)
    {
        float _668 = _650 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _658 = _668;
    }
    float _670 = _658;
    float _672 = _670;
    if (!_594)
    {
        float _674 = _474 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _672 = _674;
    }
    float _676 = _672;
    float _678 = rint(_550);
    float _680 = precise::max(_678, 0.0);
    uint _682 = uint(_680);
    uint _684 = clamp(_682, 0u, 65535u);
    float2 _1959 = float2(_58, _60);
    float2 _688 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1959, float2(0.0), isnan(_1959))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1959, float2(0.0), isnan(_1959))).xy;
    float _690 = _688.x;
    float _692 = _688.y;
    float _694 = _478 * _396;
    float _696 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[27].z, _640);
    float _698 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[18].z, _642);
    float _700 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[28].z, _646);
    float _702 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[26].z, _636);
    if (!_608)
    {
        float _704 = _696 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _660 = _704;
    }
    float _706 = _660;
    float _708 = rint(_490);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    uint _714 = clamp(_712, 0u, 65535u);
    float _716 = _500 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _718 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[25].z, _644);
    float _720 = _716;
    if (!_594)
    {
        float _722 = _698 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _628 = _722;
    }
    float _724 = _628;
    if (_574)
    {
        float _726 = _506 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _720 = _726;
    }
    float _728 = _720;
    float _730 = _700 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _732 = _728;
    float _734 = _730;
    if (!_608)
    {
        float _736 = _702 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _732 = _736;
    }
    float _738 = _732;
    if (_574)
    {
        float _740 = _514 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _734 = _740;
    }
    float _742 = _734;
    float _744 = _742;
    if (!_594)
    {
        float _746 = _528 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _666 = _746;
    }
    float _748 = _666;
    if (!_608)
    {
        float _750 = _718 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _744 = _750;
    }
    float _752 = _744;
    float _754 = 0.0 + _706;
    float _756 = precise::clamp(_754, 0.0, 1.0);
    float _758 = 0.0 + _724;
    float _760 = precise::clamp(_758, 0.0, 1.0);
    float3 _2098 = float3(_752, _738, float(int(_684)));
    float3 _2102 = select(_2098, float3(0.0), isnan(_2098));
    float _762 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2102.xy, uint(rint(_2102.z)), _756);
    float3 _2111 = float3(_748, _676, float(int(_616)));
    float3 _2113 = select(_2111, float3(0.0), isnan(_2111));
    float _764 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2113.xy, uint(rint(_2113.z)), _760);
    float3 _2122 = float3(_522, _694, float(int(_714)));
    float3 _2124 = select(_2122, float3(0.0), isnan(_2122));
    float _766 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2124.xy, uint(rint(_2124.z)), _526);
    float _768 = fma(_690, 2.0, -1.0);
    float _770 = fma(_692, 2.0, -1.0);
    float _772 = _768 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _774 = _770 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _776 = fma(_772, 2.0, _58);
    float _778 = fma(_774, 2.0, _60);
    float2 _2151 = float2(_776, _778);
    float _780 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2151, float2(0.0), isnan(_2151))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2151, float2(0.0), isnan(_2151))).x;
    float _782 = -_152;
    float _784 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _786 = _782 + _784;
    float _788 = -_152;
    float _790 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _792 = _788 + _790;
    float _794 = _786 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _796 = precise::clamp(_794, 0.0, 1.0);
    float _798 = _792 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _800 = precise::clamp(_798, 0.0, 1.0);
    float _802 = _762 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _804 = _766 + _796;
    float _806 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[49].z, _802);
    float _808 = _806 + _800;
    out.m_51.x = _780;
    out.m_51.y = _804;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _808;
    return out;
}

