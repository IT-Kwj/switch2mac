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
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
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
    float2 _558 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_558, float2(0.0), isnan(_558)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _575 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_575, float2(0.0), isnan(_575))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_575, float2(0.0), isnan(_575))).x;
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
    float _186 = _178 * _74;
    float _188 = -_178;
    bool _192 = _188 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _194 = fma(_182, _182, _184);
    float _196 = -_178;
    bool _198 = _196 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _200 = _178 * _72;
    bool _202 = !_192;
    uint _205 = uint(_202 ? 0 : 1);
    float _207 = rsqrt(_194);
    uint _209 = 2u;
    if (!_192)
    {
        _209 = 1u;
    }
    uint _211 = _209;
    uint _213 = _211;
    if (!_198)
    {
        _213 = _205;
    }
    uint _215 = _213;
    uint _217 = min(_215, 2u);
    float _219 = _164 * _207;
    float _221 = _168 * _207;
    int _224 = int(_217) << 2;
    float _226 = _182 * _207;
    float _228 = _219 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _230 = uint(int(uint(_224) >> uint(2)));
    uint _232 = uint(int(uint(int(_230)) >> uint(2)));
    int _234 = int(_230) & 3;
    float _236 = (*spvDescriptorSet0.fp_c1)._m0[int(_232)][_234];
    float _238 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[35].x, _228);
    float _240 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].z, _238);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = abs(_248);
    float _252 = log2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _256 = exp2(_254);
    float _258 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _260 = fma(_221, _258, _186);
    float _262 = fma(_219, _258, _200);
    float _264 = fma(_226, _258, _178);
    bool _266 = as_type<int>(_236) == 1216;
    if (!_266)
    {
        bool _268 = as_type<int>(_236) == 1488;
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
            _308 = _300;
            _310 = _302;
            _312 = _298;
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
            _308 = _340;
            _310 = _342;
            _312 = _338;
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
            _308 = _372;
            _310 = _374;
            _312 = _370;
        }
    }
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float2 _1165 = float2(_56, _58);
    float2 _388 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1165, float2(0.0), isnan(_1165))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1165, float2(0.0), isnan(_1165))).xy;
    float _390 = _388.x;
    float _392 = _388.y;
    float _394 = _200 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _396 = _200 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _398 = 1.0 / _378;
    float _400 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[15].x, _394);
    float _402 = _200 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _404 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[13].x, _396);
    float _406 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[15].z, _400);
    float _408 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[12].x, _402);
    float _410 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].z, _404);
    float _412 = _406 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _414 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[12].z, _408);
    float _416 = _410 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _418 = _414 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _420 = 1.0 / _412;
    float _422 = _398 * _380;
    float _424 = float(int(_215));
    float _426 = _398 * _382;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = _398 * _384;
    float _432 = _428 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _434 = rint(_424);
    float _436 = precise::max(_434, 0.0);
    uint _438 = uint(_436);
    uint _440 = clamp(_438, 0u, 65535u);
    float _442 = _432 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _444 = _418 * _420;
    float _446 = _416 * _420;
    float _448 = _432 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _450 = fma(_442, 0.5, _430);
    float _452 = fma(_442, -0.5, _430);
    float _454 = fma(_448, 0.5, _422);
    float2 _1293 = float2(_444, _446);
    float2 _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1293, float2(0.0), isnan(_1293))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1293, float2(0.0), isnan(_1293))).xy;
    float _458 = _456.x;
    float _460 = _456.y;
    float _462 = fma(_448, -0.5, _422);
    float _464 = fma(_392, 2.0, -1.0);
    float _466 = fma(_390, 2.0, -1.0);
    float _468 = _464 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _470 = _466 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _472 = fma(_468, 2.0, _58);
    float _474 = fma(_470, 2.0, _56);
    float3 _1332 = float3(_452, _454, float(int(_440)));
    float3 _1336 = select(_1332, float3(0.0), isnan(_1332));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1336.xy, uint(rint(_1336.z)), _428);
    float3 _1345 = float3(_450, _454, float(int(_440)));
    float3 _1347 = select(_1345, float3(0.0), isnan(_1345));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1347.xy, uint(rint(_1347.z)), _428);
    float3 _1356 = float3(_450, _462, float(int(_440)));
    float3 _1358 = select(_1356, float3(0.0), isnan(_1356));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1358.xy, uint(rint(_1358.z)), _428);
    float3 _1367 = float3(_452, _462, float(int(_440)));
    float3 _1369 = select(_1367, float3(0.0), isnan(_1367));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1369.xy, uint(rint(_1369.z)), _428);
    float2 _1375 = float2(_474, _472);
    float _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1375, float2(0.0), isnan(_1375))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1375, float2(0.0), isnan(_1375))).x;
    float _486 = _200 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _488 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[14].x, _486);
    float _490 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[14].z, _488);
    float _492 = _490 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _494 = precise::min(_492, 1.0);
    float _496 = -_458;
    float _498 = fma(_496, _458, _460);
    float _500 = -_458;
    float _502 = _494 + _500;
    float _504 = fma(_502, _502, _498);
    bool _506 = _502 <= 0.001000000047497451305389404296875;
    float _508 = float(_506);
    float _510 = 1.0 / _504;
    float _512 = -_178;
    float _514 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _516 = _512 + _514;
    float _518 = _516 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _520 = precise::clamp(_518, 0.0, 1.0);
    float _522 = _498 * _510;
    float _524 = -_178;
    float _526 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _528 = _524 + _526;
    float _530 = precise::max(_522, _508);
    float _532 = _528 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = precise::min(_530, 1.0);
    float _538 = _536 + _520;
    float _540 = _478 + _476;
    float _542 = _540 + _480;
    float _544 = _542 + _482;
    float _546 = fma(_544, 0.25, _534);
    out.m_49.x = _484;
    out.m_49.y = _546;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _538;
    return out;
}

