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
    bool _274 = false;
    bool _272 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _892 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_892, float2(0.0), isnan(_892)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _909 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_909, float2(0.0), isnan(_909))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_909, float2(0.0), isnan(_909))).x;
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
    float _148 = _118 * _144;
    float _150 = _130 * _144;
    float _152 = _110 * _144;
    float _154 = _134 * _146;
    float _156 = _114 * _146;
    float _158 = _122 * _146;
    float _160 = _148 * _154;
    float _162 = _150 * _156;
    float _164 = -_160;
    float _166 = fma(_150, _158, _164);
    float _168 = _152 * _158;
    float _170 = -_162;
    float _172 = fma(_152, _154, _170);
    float _174 = _166 * _166;
    float _176 = -_72;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _180 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[46].z, _178);
    float _182 = -_168;
    float _184 = fma(_148, _156, _182);
    float _186 = fma(_172, _172, _174);
    float _188 = _180 * _76;
    float _190 = -_180;
    bool _194 = _190 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _196 = fma(_184, _184, _186);
    float _198 = -_180;
    bool _200 = _198 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _202 = !_194;
    uint _205 = uint(_202 ? 0 : 1);
    float _207 = rsqrt(_196);
    uint _209 = 2u;
    if (!_194)
    {
        _209 = 1u;
    }
    uint _211 = _209;
    uint _213 = _211;
    if (!_200)
    {
        _213 = _205;
    }
    uint _215 = _213;
    uint _217 = min(_215, 2u);
    float _219 = _166 * _207;
    float _221 = _172 * _207;
    int _224 = int(_217) << 2;
    float _226 = _184 * _207;
    float _228 = _219 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _230 = _180 * _74;
    uint _232 = uint(int(uint(_224) >> uint(2)));
    uint _234 = uint(int(uint(int(_232)) >> uint(2)));
    int _236 = int(_232) & 3;
    float _238 = (*spvDescriptorSet0.fp_c1)._m0[int(_234)][_236];
    float _240 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[35].x, _228);
    float _242 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].z, _240);
    float _244 = abs(_242);
    float _246 = -_244;
    float _248 = _246 + 1.0;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = abs(_250);
    float _254 = log2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _258 = exp2(_256);
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _262 = fma(_221, _260, _188);
    float _264 = fma(_219, _260, _230);
    float _266 = fma(_226, _260, _180);
    bool _268 = as_type<int>(_238) == 1216;
    if (!_268)
    {
        bool _270 = as_type<int>(_238) == 1488;
        _272 = _270;
        if (!_272)
        {
            _274 = true;
        }
    }
    float _308;
    float _310;
    float _312;
    float _314;
    if (!_272)
    {
        if (!_274)
        {
            float _276 = _264 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _278 = _264 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _280 = _264 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _282 = _264 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _284 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].x, _276);
            float _286 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].x, _278);
            float _288 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].x, _280);
            float _290 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].x, _282);
            float _292 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].z, _284);
            float _294 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[1].z, _286);
            float _296 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].z, _288);
            float _298 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[3].z, _290);
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _308 = _306;
            _310 = _304;
            _312 = _302;
            _314 = _300;
        }
    }
    if ((false || _274) || _272)
    {
        if ((!_274) || _272)
        {
            _272 = false;
            float _316 = _264 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _318 = _264 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _320 = _264 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _322 = _264 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _324 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[4].x, _316);
            float _326 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[5].x, _318);
            float _328 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[6].x, _320);
            float _330 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[7].x, _322);
            float _332 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[4].z, _324);
            float _334 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[5].z, _326);
            float _336 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[6].z, _328);
            float _338 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[7].z, _330);
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _308 = _346;
            _310 = _344;
            _312 = _342;
            _314 = _340;
        }
        if (false || _274)
        {
            _274 = false;
            float _348 = _264 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _350 = _264 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _352 = _264 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _354 = _264 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _356 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[8].x, _348);
            float _358 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[9].x, _350);
            float _360 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[10].x, _352);
            float _362 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[11].x, _354);
            float _364 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[8].z, _356);
            float _366 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[9].z, _358);
            float _368 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[10].z, _360);
            float _370 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[11].z, _362);
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _308 = _378;
            _310 = _376;
            _312 = _374;
            _314 = _372;
        }
    }
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float _386 = _314;
    float _388 = _230 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _390 = -_230;
    float _392 = _390 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _394 = -_188;
    float _396 = _394 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _398 = -_230;
    float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _402 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[20].x, _388);
    float _404 = _392 * _392;
    float2 _1532 = float2(_58, _60);
    float2 _408 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1532, float2(0.0), isnan(_1532))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1532, float2(0.0), isnan(_1532))).xy;
    float _410 = _408.x;
    float _412 = _408.y;
    float _414 = -_188;
    float _416 = _414 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _418 = _400 * _400;
    float _420 = fma(_396, _396, _404);
    float _422 = -_180;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _426 = 1.0 / _380;
    float _428 = fma(_416, _416, _418);
    float _430 = -_180;
    float _432 = _430 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _434 = fma(_424, _424, _420);
    float _436 = float(int(_215));
    float _438 = _230 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _440 = fma(_432, _432, _428);
    float _442 = _230 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _444 = sqrt(_434);
    float _446 = _230 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _448 = _230 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _450 = _230 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _452 = _230 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _454 = _230 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _456 = _230 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _458 = _426 * _382;
    float _460 = precise::clamp(_458, 0.0, 1.0);
    float _462 = sqrt(_440);
    float _464 = _426 * _384;
    float _466 = _230 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _468 = _230 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _470 = _230 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _472 = _230 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _474 = _230 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _476 = _230 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    bool _478 = _444 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _480 = _230 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _482 = _444 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _484 = _230 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _486 = rint(_436);
    float _488 = precise::max(_486, 0.0);
    uint _490 = uint(_488);
    uint _492 = clamp(_490, 0u, 65535u);
    bool _494 = !_478;
    int _496 = _494 ? 0 : 1;
    float _498 = _230 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _500 = _426 * _386;
    bool _502 = _462 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _504 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[19].x, _438);
    bool _506 = _462 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _508 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[22].x, _442);
    float _510 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[23].x, _446);
    int _512 = 2;
    if (!_478)
    {
        _512 = 1;
    }
    int _514 = _512;
    float _516 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[21].x, _448);
    int _518 = _514;
    if (!_482)
    {
        _518 = _496;
    }
    int _520 = _518;
    float _522 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _460;
    float _524 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[24].x, _450);
    float _526 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[16].x, _452);
    float _528 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[17].x, _454);
    float _530 = _522 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _532 = _522 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _534 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[18].x, _456);
    float _536 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[25].x, _466);
    float _538 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[26].x, _468);
    float _540 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[27].x, _470);
    float _542 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[28].x, _472);
    float _544 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[29].x, _474);
    float _546 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[30].x, _476);
    float _548 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[31].x, _480);
    float _550 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[32].x, _484);
    bool _552 = !_502;
    int _554 = _552 ? 0 : 1;
    float _556 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[33].x, _498);
    float _558 = fma(_530, -0.5, _500);
    float _560 = fma(_532, 0.5, _464);
    int _562 = 2;
    if (!_502)
    {
        _562 = 1;
    }
    int _564 = _562;
    int _566 = _564;
    if (!_506)
    {
        _566 = _554;
    }
    int _568 = _566;
    float3 _1856 = float3(_558, _560, float(int(_492)));
    float3 _1860 = select(_1856, float3(0.0), isnan(_1856));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1860.xy, uint(rint(_1860.z)), _460);
    float _572 = float(_520);
    float _574 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[19].z, _504);
    float _576 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[20].z, _402);
    float _578 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[21].z, _516);
    float _580 = precise::min(_572, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _582 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[22].z, _508);
    float _584 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[23].z, _510);
    float _586 = float(_568);
    float _588 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[24].z, _524);
    bool _590 = _580 != 1.0;
    bool _592 = isnan(_580);
    bool _594 = _590 || _592;
    bool _596 = isnan(1.0);
    bool _598 = _594 || _596;
    float _600 = _574 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _602 = _576 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _604 = _578 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _606 = precise::min(_586, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _608 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[18].z, _534);
    float _610 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[30].z, _546);
    float _612 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[33].z, _556);
    bool _614 = _606 != 1.0;
    bool _616 = isnan(_606);
    bool _618 = _614 || _616;
    bool _620 = isnan(1.0);
    bool _622 = _618 || _620;
    float _624 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[16].z, _526);
    bool _626 = _606 != 0.0;
    bool _628 = isnan(_606);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[27].z, _540);
    float _638 = _610 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _640 = _600;
    float _642 = _602;
    float _644 = _604;
    float _646 = _638;
    if (_598)
    {
        float _648 = _582 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _640 = _648;
    }
    float _650 = _640;
    float _652 = _650;
    if (_598)
    {
        float _654 = _584 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _642 = _654;
    }
    float _656 = _642;
    float _658 = _656;
    if (_598)
    {
        float _660 = _588 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _644 = _660;
    }
    float _662 = _644;
    bool _664 = _580 != 0.0;
    bool _666 = isnan(_580);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[17].z, _528);
    float _676 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[29].z, _544);
    float _678 = fma(_530, 0.5, _500);
    float _680 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[28].z, _542);
    float _682 = _662;
    if (_622)
    {
        float _684 = _612 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _646 = _684;
    }
    float _686 = _646;
    float _688 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _690 = _686;
    if (!_634)
    {
        float _692 = _636 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _690 = _692;
    }
    float _694 = _690;
    float _696 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[32].z, _550);
    float _698 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _700 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[31].z, _548);
    float _702 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[26].z, _538);
    float _704 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[25].z, _536);
    if (!_672)
    {
        float _706 = _608 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _682 = _706;
    }
    float _708 = _682;
    if (!_672)
    {
        float _710 = _624 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _652 = _710;
    }
    float _712 = _652;
    if (!_672)
    {
        float _714 = _674 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _658 = _714;
    }
    float _716 = _658;
    float _718 = 0.0 + _694;
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = 0.0 + _708;
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = _676 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _728 = _680 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _730 = _726;
    float _732 = _728;
    if (_622)
    {
        float _734 = _696 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _730 = _734;
    }
    float _736 = _730;
    float _738 = _724 * _688;
    float _740 = _724 * _698;
    float _742 = _736;
    if (_622)
    {
        float _744 = _700 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _732 = _744;
    }
    float _746 = _732;
    float _748 = _746;
    if (!_634)
    {
        float _750 = _702 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _742 = _750;
    }
    float _752 = _742;
    float _754 = fma(_532, -0.5, _464);
    if (!_634)
    {
        float _756 = _704 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _748 = _756;
    }
    float _758 = _748;
    float _760 = fma(_738, 0.5, _712);
    float _762 = _688 * _720;
    float _764 = fma(_738, -0.5, _712);
    float _766 = fma(_740, 0.5, _716);
    float _768 = fma(_740, -0.5, _716);
    float _770 = fma(_762, 0.5, _758);
    float _772 = fma(_762, -0.5, _758);
    float _774 = rint(_580);
    float _776 = precise::max(_774, 0.0);
    uint _778 = uint(_776);
    uint _780 = clamp(_778, 0u, 65535u);
    float _782 = _698 * _720;
    float _784 = rint(_606);
    float _786 = precise::max(_784, 0.0);
    uint _788 = uint(_786);
    uint _790 = clamp(_788, 0u, 65535u);
    float _792 = fma(_782, 0.5, _752);
    float _794 = fma(_782, -0.5, _752);
    float3 _2241 = float3(_678, _560, float(int(_492)));
    float3 _2243 = select(_2241, float3(0.0), isnan(_2241));
    float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2243.xy, uint(rint(_2243.z)), _460);
    float _798 = fma(_410, 2.0, -1.0);
    float _800 = fma(_412, 2.0, -1.0);
    float _802 = _798 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _804 = _800 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _806 = fma(_802, 2.0, _58);
    float _808 = fma(_804, 2.0, _60);
    float3 _2273 = float3(_678, _754, float(int(_492)));
    float3 _2275 = select(_2273, float3(0.0), isnan(_2273));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2275.xy, uint(rint(_2275.z)), _460);
    float3 _2284 = float3(_558, _754, float(int(_492)));
    float3 _2286 = select(_2284, float3(0.0), isnan(_2284));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2286.xy, uint(rint(_2286.z)), _460);
    float3 _2295 = float3(_764, _766, float(int(_780)));
    float3 _2297 = select(_2295, float3(0.0), isnan(_2295));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2297.xy, uint(rint(_2297.z)), _724);
    float3 _2306 = float3(_760, _766, float(int(_780)));
    float3 _2308 = select(_2306, float3(0.0), isnan(_2306));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2308.xy, uint(rint(_2308.z)), _724);
    float3 _2317 = float3(_760, _768, float(int(_780)));
    float3 _2319 = select(_2317, float3(0.0), isnan(_2317));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2319.xy, uint(rint(_2319.z)), _724);
    float3 _2328 = float3(_772, _792, float(int(_790)));
    float3 _2330 = select(_2328, float3(0.0), isnan(_2328));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2330.xy, uint(rint(_2330.z)), _720);
    float3 _2339 = float3(_770, _792, float(int(_790)));
    float3 _2341 = select(_2339, float3(0.0), isnan(_2339));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2341.xy, uint(rint(_2341.z)), _720);
    float3 _2350 = float3(_770, _794, float(int(_790)));
    float3 _2352 = select(_2350, float3(0.0), isnan(_2350));
    float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2352.xy, uint(rint(_2352.z)), _720);
    float3 _2361 = float3(_764, _768, float(int(_780)));
    float3 _2363 = select(_2361, float3(0.0), isnan(_2361));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2363.xy, uint(rint(_2363.z)), _724);
    float3 _2372 = float3(_772, _794, float(int(_790)));
    float3 _2374 = select(_2372, float3(0.0), isnan(_2372));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2374.xy, uint(rint(_2374.z)), _720);
    float2 _2380 = float2(_806, _808);
    float _830 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2380, float2(0.0), isnan(_2380))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2380, float2(0.0), isnan(_2380))).x;
    float _832 = -_180;
    float _834 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _836 = _832 + _834;
    float _838 = -_180;
    float _840 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _842 = _838 + _840;
    float _844 = _836 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _846 = precise::clamp(_844, 0.0, 1.0);
    float _848 = _796 + _570;
    float _850 = _848 + _810;
    float _852 = _816 + _814;
    float _854 = _850 + _812;
    float _856 = _822 + _820;
    float _858 = _852 + _818;
    float _860 = fma(_854, 0.25, _846);
    float _862 = _856 + _824;
    float _864 = _858 + _826;
    float _866 = _862 + _828;
    float _868 = _864 * 0.25;
    float _870 = _866 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _872 = _870 * 0.25;
    float _874 = fma(_868, (*spvDescriptorSet0.fp_c3)._m0[49].z, _872);
    float _876 = _842 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _878 = precise::clamp(_876, 0.0, 1.0);
    float _880 = _874 + _878;
    out.m_51.x = _830;
    out.m_51.y = _860;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _880;
    return out;
}

