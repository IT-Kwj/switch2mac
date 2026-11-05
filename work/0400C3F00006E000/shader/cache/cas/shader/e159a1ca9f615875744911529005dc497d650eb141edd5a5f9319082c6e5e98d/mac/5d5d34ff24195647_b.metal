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
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _294 = false;
    bool _292 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _515 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _532 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_532, float2(0.0), isnan(_532))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _86;
    float _96 = 1.0 / _90;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = _92 * _98;
    float _102 = _68 * _100;
    float _104 = _72 * _100;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _94 * _106;
    float _110 = -_102;
    float _112 = fma(_108, _70, _110);
    float _114 = -_104;
    float _116 = fma(_108, _76, _114);
    float _118 = -_100;
    float _120 = _118 + _108;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _124 = _96 * _122;
    float _126 = _112 * _112;
    float _128 = -_102;
    float _130 = fma(_124, _74, _128);
    float _132 = -_104;
    float _134 = fma(_124, _78, _132);
    float _136 = fma(_116, _116, _126);
    float _138 = -_100;
    float _140 = _138 + _124;
    float _142 = _130 * _130;
    float _144 = fma(_120, _120, _136);
    float _146 = fma(_134, _134, _142);
    float _148 = fma(_140, _140, _146);
    float _150 = rsqrt(_144);
    float _152 = -_66;
    float _154 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _156 = rsqrt(_148);
    float _158 = 1.0 / _154;
    float _160 = _116 * _150;
    float _162 = _120 * _150;
    float _164 = _112 * _150;
    float _166 = _140 * _156;
    float _168 = _130 * _156;
    float _170 = _134 * _156;
    float _172 = _160 * _166;
    float _174 = _162 * _168;
    float _176 = -_172;
    float _178 = fma(_162, _170, _176);
    float _180 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _182 = _158 * _180;
    float _184 = _164 * _170;
    float _186 = -_174;
    float _188 = fma(_164, _166, _186);
    float _190 = _178 * _178;
    float _192 = -_184;
    float _194 = fma(_160, _168, _192);
    float _196 = -_182;
    bool _200 = _196 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _202 = fma(_188, _188, _190);
    float _204 = -_182;
    bool _206 = _204 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _208 = -_182;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _212 = fma(_194, _194, _202);
    bool _214 = !_200;
    int _217 = _214 ? 0 : 1;
    float _219 = rsqrt(_212);
    int _221 = 2;
    if (!_200)
    {
        _221 = 1;
    }
    int _223 = _221;
    int _225 = _223;
    if (!_206)
    {
        _225 = _217;
    }
    int _227 = _225;
    int _229 = _227 + 1;
    uint _232 = uint(_229);
    if (!_210)
    {
        _232 = uint(_227);
    }
    uint _234 = _232;
    uint _236 = min(_234, 2u);
    float _238 = _178 * _219;
    float _240 = _188 * _219;
    float _242 = _194 * _219;
    int _244 = int(_236) << 2;
    float _246 = _238 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _248 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[35].x, _246);
    float _250 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[35].z, _248);
    uint _252 = uint(int(uint(_244) >> uint(2)));
    uint _254 = uint(int(uint(int(_252)) >> uint(2)));
    int _256 = int(_252) & 3;
    float _258 = (*spvDescriptorSet0.fp_c1)._m0[int(_254)][_256];
    float _260 = abs(_250);
    float _262 = -_260;
    float _264 = _262 + 1.0;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = abs(_266);
    float _270 = log2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _274 = exp2(_272);
    float _276 = _274 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _278 = _238 * _276;
    float _280 = _240 * _276;
    float _282 = fma(_242, _276, _182);
    float _284 = fma(_182, _68, _278);
    float _286 = fma(_182, _72, _280);
    bool _288 = as_type<int>(_258) == 1392;
    if (!_288)
    {
        bool _290 = as_type<int>(_258) == 1664;
        _292 = _290;
        if (!_292)
        {
            _294 = true;
        }
    }
    float _328;
    float _330;
    float _332;
    float _334;
    if (!_292)
    {
        if (!_294)
        {
            float _296 = _284 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _298 = _284 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _300 = _284 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _302 = _284 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _304 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].x, _296);
            float _306 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].x, _298);
            float _308 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[2].x, _300);
            float _310 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[3].x, _302);
            float _312 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[0].z, _304);
            float _314 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].z, _306);
            float _316 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[2].z, _308);
            float _318 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[3].z, _310);
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _328 = _326;
            _330 = _324;
            _332 = _322;
            _334 = _320;
        }
    }
    if ((false || _294) || _292)
    {
        if ((!_294) || _292)
        {
            _292 = false;
            float _336 = _284 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _338 = _284 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _340 = _284 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _342 = _284 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _344 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[4].x, _336);
            float _346 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[5].x, _338);
            float _348 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[6].x, _340);
            float _350 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[7].x, _342);
            float _352 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[4].z, _344);
            float _354 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[5].z, _346);
            float _356 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[6].z, _348);
            float _358 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[7].z, _350);
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _328 = _366;
            _330 = _364;
            _332 = _362;
            _334 = _360;
        }
        if (false || _294)
        {
            _294 = false;
            float _368 = _284 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _370 = _284 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _372 = _284 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _374 = _284 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _376 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[8].x, _368);
            float _378 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[9].x, _370);
            float _380 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[10].x, _372);
            float _382 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[11].x, _374);
            float _384 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[8].z, _376);
            float _386 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[9].z, _378);
            float _388 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[10].z, _380);
            float _390 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[11].z, _382);
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _328 = _398;
            _330 = _396;
            _332 = _394;
            _334 = _392;
        }
    }
    float _400 = _328;
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = float(int(_234));
    float _410 = 1.0 / _400;
    float _412 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _414 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _416 = rint(_408);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    uint _422 = clamp(_420, 0u, 65535u);
    float _424 = _410 * _402;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _410 * _404;
    float _430 = _410 * _406;
    float _432 = fma(_426, _414, _428);
    float _434 = fma(_426, _412, _430);
    float _436 = -_412;
    float _438 = fma(_426, _436, _430);
    float _440 = -_414;
    float _442 = fma(_426, _440, _428);
    float3 _1215 = float3(_430, _432, float(int(_422)));
    float3 _1219 = select(_1215, float3(0.0), isnan(_1215));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1219.xy, uint(rint(_1219.z)), _426);
    float3 _1228 = float3(_434, _432, float(int(_422)));
    float3 _1230 = select(_1228, float3(0.0), isnan(_1228));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1230.xy, uint(rint(_1230.z)), _426);
    float3 _1239 = float3(_438, _432, float(int(_422)));
    float3 _1241 = select(_1239, float3(0.0), isnan(_1239));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1241.xy, uint(rint(_1241.z)), _426);
    float3 _1250 = float3(_434, _428, float(int(_422)));
    float3 _1252 = select(_1250, float3(0.0), isnan(_1250));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1252.xy, uint(rint(_1252.z)), _426);
    float3 _1261 = float3(_430, _428, float(int(_422)));
    float3 _1263 = select(_1261, float3(0.0), isnan(_1261));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1263.xy, uint(rint(_1263.z)), _426);
    float3 _1272 = float3(_438, _428, float(int(_422)));
    float3 _1274 = select(_1272, float3(0.0), isnan(_1272));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1274.xy, uint(rint(_1274.z)), _426);
    float3 _1283 = float3(_434, _442, float(int(_422)));
    float3 _1285 = select(_1283, float3(0.0), isnan(_1283));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1285.xy, uint(rint(_1285.z)), _426);
    float3 _1294 = float3(_430, _442, float(int(_422)));
    float3 _1296 = select(_1294, float3(0.0), isnan(_1294));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1296.xy, uint(rint(_1296.z)), _426);
    float3 _1305 = float3(_438, _442, float(int(_422)));
    float3 _1307 = select(_1305, float3(0.0), isnan(_1305));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1307.xy, uint(rint(_1307.z)), _426);
    float2 _1313 = float2(_52, _54);
    float _462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1313, float2(0.0), isnan(_1313))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1313, float2(0.0), isnan(_1313))).x;
    float _464 = -_182;
    float _466 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _468 = _464 + _466;
    float _470 = _446 + _444;
    float _472 = _470 + _448;
    float _474 = _472 + _450;
    float _476 = _474 + _452;
    float _478 = _476 + _454;
    float _480 = _478 + _456;
    float _482 = _480 + _458;
    float _484 = -_182;
    float _486 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _488 = _484 + _486;
    float _490 = _488 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _492 = precise::clamp(_490, 0.0, 1.0);
    float _494 = _482 + _460;
    float _496 = _468 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = fma(_494, 0.111111111938953399658203125, _492);
    float _502 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[48].w, _498);
    out.m_45.x = _462;
    out.m_45.y = _500;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _502;
    return out;
}

