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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
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
    float2 _572 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_572, float2(0.0), isnan(_572)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _589 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_589, float2(0.0), isnan(_589))).x;
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
            _332 = _326;
            _334 = _322;
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
            _332 = _366;
            _334 = _362;
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
            _332 = _398;
            _334 = _394;
            _336 = _396;
        }
    }
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = 1.0 / _402;
    float _412 = float(int(_236));
    float _414 = rint(_412);
    float _416 = precise::max(_414, 0.0);
    uint _418 = uint(_416);
    uint _420 = clamp(_418, 0u, 65535u);
    float _422 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _424 = _410 * _404;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _410 * _406;
    float _430 = _410 * _408;
    float _432 = _426 * _422;
    float _434 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _436 = fma(_432, 0.5, _428);
    float _438 = fma(_432, 1.5, _428);
    float _440 = fma(_432, -0.5, _428);
    float _442 = fma(_432, -1.5, _428);
    float _444 = _426 * _434;
    float _446 = fma(_444, 1.5, _430);
    float _448 = fma(_444, 0.5, _430);
    float3 _1280 = float3(_436, _446, float(int(_420)));
    float3 _1284 = select(_1280, float3(0.0), isnan(_1280));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1284.xy, uint(rint(_1284.z)), _426);
    float3 _1293 = float3(_438, _446, float(int(_420)));
    float3 _1295 = select(_1293, float3(0.0), isnan(_1293));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1295.xy, uint(rint(_1295.z)), _426);
    float3 _1304 = float3(_440, _446, float(int(_420)));
    float3 _1306 = select(_1304, float3(0.0), isnan(_1304));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1306.xy, uint(rint(_1306.z)), _426);
    float3 _1315 = float3(_442, _446, float(int(_420)));
    float3 _1317 = select(_1315, float3(0.0), isnan(_1315));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1317.xy, uint(rint(_1317.z)), _426);
    float3 _1326 = float3(_438, _448, float(int(_420)));
    float3 _1328 = select(_1326, float3(0.0), isnan(_1326));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1328.xy, uint(rint(_1328.z)), _426);
    float3 _1337 = float3(_436, _448, float(int(_420)));
    float3 _1339 = select(_1337, float3(0.0), isnan(_1337));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1339.xy, uint(rint(_1339.z)), _426);
    float2 _1345 = float2(_54, _56);
    float2 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1345, float2(0.0), isnan(_1345))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1345, float2(0.0), isnan(_1345))).xy;
    float _466 = _464.x;
    float _468 = _464.y;
    float3 _1360 = float3(_440, _448, float(int(_420)));
    float3 _1362 = select(_1360, float3(0.0), isnan(_1360));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1362.xy, uint(rint(_1362.z)), _426);
    float _472 = fma(_444, -0.5, _430);
    float _474 = _452 + _450;
    float _476 = _474 + _454;
    float _478 = _476 + _456;
    float _480 = _478 + _458;
    float3 _1386 = float3(_442, _448, float(int(_420)));
    float3 _1388 = select(_1386, float3(0.0), isnan(_1386));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1388.xy, uint(rint(_1388.z)), _426);
    float3 _1397 = float3(_438, _472, float(int(_420)));
    float3 _1399 = select(_1397, float3(0.0), isnan(_1397));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1399.xy, uint(rint(_1399.z)), _426);
    float3 _1408 = float3(_436, _472, float(int(_420)));
    float3 _1410 = select(_1408, float3(0.0), isnan(_1408));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1410.xy, uint(rint(_1410.z)), _426);
    float3 _1419 = float3(_440, _472, float(int(_420)));
    float3 _1421 = select(_1419, float3(0.0), isnan(_1419));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1421.xy, uint(rint(_1421.z)), _426);
    float _490 = fma(_444, -1.5, _430);
    float _492 = _480 + _460;
    float _494 = fma(_466, 2.0, -1.0);
    float _496 = fma(_468, 2.0, -1.0);
    float _498 = _492 + _470;
    float _500 = _494 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _502 = _496 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _504 = fma(_500, 2.0, _54);
    float _506 = fma(_502, 2.0, _56);
    float3 _1460 = float3(_442, _472, float(int(_420)));
    float3 _1462 = select(_1460, float3(0.0), isnan(_1460));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1462.xy, uint(rint(_1462.z)), _426);
    float3 _1471 = float3(_438, _490, float(int(_420)));
    float3 _1473 = select(_1471, float3(0.0), isnan(_1471));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1473.xy, uint(rint(_1473.z)), _426);
    float3 _1482 = float3(_436, _490, float(int(_420)));
    float3 _1484 = select(_1482, float3(0.0), isnan(_1482));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1484.xy, uint(rint(_1484.z)), _426);
    float3 _1493 = float3(_440, _490, float(int(_420)));
    float3 _1495 = select(_1493, float3(0.0), isnan(_1493));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1495.xy, uint(rint(_1495.z)), _426);
    float3 _1504 = float3(_442, _490, float(int(_420)));
    float3 _1506 = select(_1504, float3(0.0), isnan(_1504));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1506.xy, uint(rint(_1506.z)), _426);
    float2 _1512 = float2(_504, _506);
    float _518 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1512, float2(0.0), isnan(_1512))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1512, float2(0.0), isnan(_1512))).x;
    float _520 = -_184;
    float _522 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _524 = _520 + _522;
    float _526 = _524 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _528 = precise::clamp(_526, 0.0, 1.0);
    float _530 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[48].w, _528);
    float _532 = _498 + _482;
    float _534 = _532 + _484;
    float _536 = _534 + _486;
    float _538 = _536 + _488;
    float _540 = _538 + _508;
    float _542 = _540 + _510;
    float _544 = -_184;
    float _546 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _548 = _544 + _546;
    float _550 = _542 + _512;
    float _552 = _548 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _554 = precise::clamp(_552, 0.0, 1.0);
    float _556 = _550 + _514;
    float _558 = _556 + _516;
    float _560 = fma(_558, 0.0625, _554);
    out.m_47.x = _518;
    out.m_47.y = _560;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _530;
    return out;
}

