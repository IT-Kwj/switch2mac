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
    bool _284 = false;
    bool _282 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _505 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_505, float2(0.0), isnan(_505)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _522 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_522, float2(0.0), isnan(_522))).x;
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
    float _152 = rsqrt(_148);
    float _154 = -_66;
    float _156 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _158 = _116 * _150;
    float _160 = _120 * _150;
    float _162 = 1.0 / _156;
    float _164 = _112 * _150;
    float _166 = _140 * _152;
    float _168 = _130 * _152;
    float _170 = _134 * _152;
    float _172 = _158 * _166;
    float _174 = _160 * _168;
    float _176 = -_172;
    float _178 = fma(_160, _170, _176);
    float _180 = _164 * _170;
    float _182 = -_174;
    float _184 = fma(_164, _166, _182);
    float _186 = _178 * _178;
    float _188 = -_180;
    float _190 = fma(_158, _168, _188);
    float _192 = fma(_184, _184, _186);
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _196 = _162 * _194;
    float _198 = fma(_190, _190, _192);
    float _200 = -_196;
    bool _204 = _200 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _206 = rsqrt(_198);
    float _208 = -_196;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _212 = !_204;
    uint _215 = uint(_212 ? 0 : 1);
    uint _217 = 2u;
    if (!_204)
    {
        _217 = 1u;
    }
    uint _219 = _217;
    uint _221 = _219;
    if (!_210)
    {
        _221 = _215;
    }
    uint _223 = _221;
    float _225 = _178 * _206;
    float _227 = _184 * _206;
    float _229 = _190 * _206;
    uint _231 = min(_223, 2u);
    float _233 = _225 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _236 = int(_231) << 2;
    float _238 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[35].x, _233);
    float _240 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[35].z, _238);
    uint _242 = uint(int(uint(_236) >> uint(2)));
    uint _244 = uint(int(uint(int(_242)) >> uint(2)));
    int _246 = int(_242) & 3;
    float _248 = (*spvDescriptorSet0.fp_c1)._m0[int(_244)][_246];
    float _250 = abs(_240);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = abs(_256);
    float _260 = log2(_258);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _264 = exp2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _268 = _225 * _266;
    float _270 = _227 * _266;
    float _272 = fma(_229, _266, _196);
    float _274 = fma(_196, _68, _268);
    float _276 = fma(_196, _72, _270);
    bool _278 = as_type<int>(_248) == 1344;
    if (!_278)
    {
        bool _280 = as_type<int>(_248) == 1616;
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
            float _294 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
            float _296 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].x, _288);
            float _298 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].x, _292);
            float _302 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, _294);
            float _304 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].z, _296);
            float _306 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].z, _300);
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
            float _326 = _274 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _328 = _274 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _330 = _274 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _274 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _334 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].x, _326);
            float _336 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].x, _328);
            float _338 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].x, _332);
            float _342 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].z, _334);
            float _344 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].z, _336);
            float _346 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].z, _340);
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
            float _358 = _274 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _360 = _274 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _362 = _274 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _274 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _366 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].x, _358);
            float _368 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].x, _360);
            float _370 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].x, _364);
            float _374 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].z, _366);
            float _376 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].z, _368);
            float _378 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
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
    float _398 = float(int(_223));
    float _400 = 1.0 / _390;
    float _402 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _404 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _406 = rint(_398);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    uint _412 = clamp(_410, 0u, 65535u);
    float _414 = _400 * _392;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _400 * _394;
    float _420 = _400 * _396;
    float _422 = fma(_416, _404, _418);
    float _424 = fma(_416, _402, _420);
    float _426 = -_402;
    float _428 = fma(_416, _426, _420);
    float _430 = -_404;
    float _432 = fma(_416, _430, _418);
    float3 _1189 = float3(_420, _422, float(int(_412)));
    float3 _1193 = select(_1189, float3(0.0), isnan(_1189));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1193.xy, uint(rint(_1193.z)), _416);
    float3 _1202 = float3(_424, _422, float(int(_412)));
    float3 _1204 = select(_1202, float3(0.0), isnan(_1202));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1204.xy, uint(rint(_1204.z)), _416);
    float3 _1213 = float3(_428, _422, float(int(_412)));
    float3 _1215 = select(_1213, float3(0.0), isnan(_1213));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1215.xy, uint(rint(_1215.z)), _416);
    float3 _1224 = float3(_424, _418, float(int(_412)));
    float3 _1226 = select(_1224, float3(0.0), isnan(_1224));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1226.xy, uint(rint(_1226.z)), _416);
    float3 _1235 = float3(_420, _418, float(int(_412)));
    float3 _1237 = select(_1235, float3(0.0), isnan(_1235));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1237.xy, uint(rint(_1237.z)), _416);
    float3 _1246 = float3(_428, _418, float(int(_412)));
    float3 _1248 = select(_1246, float3(0.0), isnan(_1246));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1248.xy, uint(rint(_1248.z)), _416);
    float3 _1257 = float3(_424, _432, float(int(_412)));
    float3 _1259 = select(_1257, float3(0.0), isnan(_1257));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1259.xy, uint(rint(_1259.z)), _416);
    float3 _1268 = float3(_420, _432, float(int(_412)));
    float3 _1270 = select(_1268, float3(0.0), isnan(_1268));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1270.xy, uint(rint(_1270.z)), _416);
    float3 _1279 = float3(_428, _432, float(int(_412)));
    float3 _1281 = select(_1279, float3(0.0), isnan(_1279));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1281.xy, uint(rint(_1281.z)), _416);
    float2 _1287 = float2(_52, _54);
    float _452 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1287, float2(0.0), isnan(_1287))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1287, float2(0.0), isnan(_1287))).x;
    float _454 = -_196;
    float _456 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _458 = _454 + _456;
    float _460 = _436 + _434;
    float _462 = _460 + _438;
    float _464 = _462 + _440;
    float _466 = _464 + _442;
    float _468 = _466 + _444;
    float _470 = _468 + _446;
    float _472 = _470 + _448;
    float _474 = -_196;
    float _476 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _478 = _474 + _476;
    float _480 = _478 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = _472 + _450;
    float _486 = _458 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _488 = precise::clamp(_486, 0.0, 1.0);
    float _490 = fma(_484, 0.111111111938953399658203125, _482);
    float _492 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[48].w, _488);
    out.m_45.x = _452;
    out.m_45.y = _490;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _492;
    return out;
}

