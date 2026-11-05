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
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
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
    bool _296 = false;
    bool _294 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _536 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_536, float2(0.0), isnan(_536)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _553 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_553, float2(0.0), isnan(_553))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_553, float2(0.0), isnan(_553))).x;
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
    float _98 = 1.0 / _92;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _94 * _100;
    float _104 = _70 * _102;
    float _106 = _74 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _96 * _108;
    float _112 = -_104;
    float _114 = fma(_110, _72, _112);
    float _116 = -_106;
    float _118 = fma(_110, _78, _116);
    float _120 = -_102;
    float _122 = _120 + _110;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _98 * _124;
    float _128 = _114 * _114;
    float _130 = -_104;
    float _132 = fma(_126, _76, _130);
    float _134 = -_106;
    float _136 = fma(_126, _80, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_102;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = fma(_122, _122, _138);
    float _148 = fma(_136, _136, _144);
    float _150 = fma(_142, _142, _148);
    float _152 = rsqrt(_146);
    float _154 = -_68;
    float _156 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _158 = rsqrt(_150);
    float _160 = 1.0 / _156;
    float _162 = _118 * _152;
    float _164 = _122 * _152;
    float _166 = _114 * _152;
    float _168 = _142 * _158;
    float _170 = _132 * _158;
    float _172 = _136 * _158;
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = -_174;
    float _180 = fma(_164, _172, _178);
    float _182 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _184 = _160 * _182;
    float _186 = -_176;
    float _188 = fma(_166, _168, _186);
    float _190 = _166 * _172;
    float _192 = _180 * _180;
    float _194 = -_184;
    bool _198 = _194 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _200 = -_190;
    float _202 = fma(_162, _170, _200);
    float _204 = fma(_188, _188, _192);
    float _206 = -_184;
    bool _208 = _206 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _210 = -_184;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _214 = fma(_202, _202, _204);
    bool _216 = !_198;
    int _219 = _216 ? 0 : 1;
    float _221 = rsqrt(_214);
    int _223 = 2;
    if (!_198)
    {
        _223 = 1;
    }
    int _225 = _223;
    int _227 = _225;
    if (!_208)
    {
        _227 = _219;
    }
    int _229 = _227;
    int _231 = _229 + 1;
    uint _234 = uint(_231);
    if (!_212)
    {
        _234 = uint(_229);
    }
    uint _236 = _234;
    uint _238 = min(_236, 2u);
    float _240 = _180 * _221;
    float _242 = _188 * _221;
    float _244 = _202 * _221;
    int _246 = int(_238) << 2;
    float _248 = _240 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _250 = uint(int(uint(_246) >> uint(2)));
    uint _252 = uint(int(uint(int(_250)) >> uint(2)));
    int _254 = int(_250) & 3;
    float _256 = (*spvDescriptorSet0.fp_c1)._m0[int(_252)][_254];
    float _258 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[35].x, _248);
    float _260 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[35].z, _258);
    float _262 = abs(_260);
    float _264 = -_262;
    float _266 = _264 + 1.0;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = abs(_268);
    float _272 = log2(_270);
    float _274 = _272 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _276 = exp2(_274);
    float _278 = _276 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _280 = _242 * _278;
    float _282 = _240 * _278;
    float _284 = fma(_244, _278, _184);
    float _286 = fma(_184, _74, _280);
    float _288 = fma(_184, _70, _282);
    bool _290 = as_type<int>(_256) == 1392;
    if (!_290)
    {
        bool _292 = as_type<int>(_256) == 1664;
        _294 = _292;
        if (!_294)
        {
            _296 = true;
        }
    }
    float _330;
    float _332;
    float _334;
    float _336;
    if (!_294)
    {
        if (!_296)
        {
            float _298 = _288 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _300 = _288 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _302 = _288 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _304 = _288 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _306 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].x, _298);
            float _308 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].x, _300);
            float _310 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[2].x, _302);
            float _312 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[3].x, _304);
            float _314 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].z, _306);
            float _316 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[1].z, _308);
            float _318 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[2].z, _310);
            float _320 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[3].z, _312);
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _330 = _328;
            _332 = _322;
            _334 = _326;
            _336 = _324;
        }
    }
    if ((false || _296) || _294)
    {
        if ((!_296) || _294)
        {
            _294 = false;
            float _338 = _288 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _340 = _288 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _342 = _288 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _344 = _288 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _346 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[4].x, _338);
            float _348 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[5].x, _340);
            float _350 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[6].x, _342);
            float _352 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[7].x, _344);
            float _354 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[4].z, _346);
            float _356 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[5].z, _348);
            float _358 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[6].z, _350);
            float _360 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[7].z, _352);
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _330 = _368;
            _332 = _362;
            _334 = _366;
            _336 = _364;
        }
        if (false || _296)
        {
            _296 = false;
            float _370 = _288 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _372 = _288 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _374 = _288 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _376 = _288 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _378 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[8].x, _370);
            float _380 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[9].x, _372);
            float _382 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[10].x, _374);
            float _384 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[11].x, _376);
            float _386 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[8].z, _378);
            float _388 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[9].z, _380);
            float _390 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[10].z, _382);
            float _392 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[11].z, _384);
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _330 = _400;
            _332 = _394;
            _334 = _398;
            _336 = _396;
        }
    }
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float2 _1175 = float2(_54, _56);
    float2 _412 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1175, float2(0.0), isnan(_1175))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1175, float2(0.0), isnan(_1175))).xy;
    float _414 = _412.x;
    float _416 = _412.y;
    float _418 = float(int(_236));
    float _420 = 1.0 / _402;
    float _422 = rint(_418);
    float _424 = precise::max(_422, 0.0);
    uint _426 = uint(_424);
    uint _428 = clamp(_426, 0u, 65535u);
    float _430 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _432 = _420 * _404;
    float _434 = _420 * _406;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _420 * _408;
    float _440 = -_430;
    float _442 = fma(_436, _440, _438);
    float _444 = fma(_414, 2.0, -1.0);
    float _446 = fma(_416, 2.0, -1.0);
    float _448 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _450 = _444 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _452 = _446 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _454 = -_448;
    float _456 = fma(_436, _454, _432);
    float _458 = fma(_450, 2.0, _54);
    float _460 = fma(_436, _448, _432);
    float _462 = fma(_452, 2.0, _56);
    float _464 = fma(_436, _430, _438);
    float3 _1269 = float3(_432, _464, float(int(_428)));
    float3 _1273 = select(_1269, float3(0.0), isnan(_1269));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1273.xy, uint(rint(_1273.z)), _436);
    float3 _1282 = float3(_460, _464, float(int(_428)));
    float3 _1284 = select(_1282, float3(0.0), isnan(_1282));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1284.xy, uint(rint(_1284.z)), _436);
    float3 _1293 = float3(_456, _464, float(int(_428)));
    float3 _1295 = select(_1293, float3(0.0), isnan(_1293));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1295.xy, uint(rint(_1295.z)), _436);
    float3 _1304 = float3(_460, _438, float(int(_428)));
    float3 _1306 = select(_1304, float3(0.0), isnan(_1304));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1306.xy, uint(rint(_1306.z)), _436);
    float3 _1315 = float3(_432, _438, float(int(_428)));
    float3 _1317 = select(_1315, float3(0.0), isnan(_1315));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1317.xy, uint(rint(_1317.z)), _436);
    float3 _1326 = float3(_456, _438, float(int(_428)));
    float3 _1328 = select(_1326, float3(0.0), isnan(_1326));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1328.xy, uint(rint(_1328.z)), _436);
    float3 _1337 = float3(_460, _442, float(int(_428)));
    float3 _1339 = select(_1337, float3(0.0), isnan(_1337));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1339.xy, uint(rint(_1339.z)), _436);
    float3 _1348 = float3(_432, _442, float(int(_428)));
    float3 _1350 = select(_1348, float3(0.0), isnan(_1348));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1350.xy, uint(rint(_1350.z)), _436);
    float3 _1359 = float3(_456, _442, float(int(_428)));
    float3 _1361 = select(_1359, float3(0.0), isnan(_1359));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1361.xy, uint(rint(_1361.z)), _436);
    float2 _1367 = float2(_458, _462);
    float _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1367, float2(0.0), isnan(_1367))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1367, float2(0.0), isnan(_1367))).x;
    float _486 = -_184;
    float _488 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _490 = _486 + _488;
    float _492 = _490 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _494 = precise::clamp(_492, 0.0, 1.0);
    float _496 = _468 + _466;
    float _498 = _496 + _470;
    float _500 = _498 + _472;
    float _502 = -_184;
    float _504 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _506 = _502 + _504;
    float _508 = _500 + _474;
    float _510 = _506 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = _508 + _476;
    float _516 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[48].w, _512);
    float _518 = _514 + _478;
    float _520 = _518 + _480;
    float _522 = _520 + _482;
    float _524 = fma(_522, 0.111111111938953399658203125, _494);
    out.m_47.x = _484;
    out.m_47.y = _524;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _516;
    return out;
}

