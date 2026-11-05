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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_34 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _282 = false;
    bool _280 = false;
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _537 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_537, float2(0.0), isnan(_537)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _554 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_554, float2(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_554, float2(0.0), isnan(_554))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_38.y;
    float _70 = in.m_36.x;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _82 = -_60;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_62;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = 1.0 / _80;
    float _92 = 1.0 / _84;
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _88;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _90 * _100;
    float _104 = _66 * _102;
    float _106 = _70 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _92 * _108;
    float _112 = 1.0 / _96;
    float _114 = -_104;
    float _116 = fma(_110, _68, _114);
    float _118 = -_106;
    float _120 = fma(_110, _74, _118);
    float _122 = -_102;
    float _124 = _122 + _110;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _98 * _126;
    float _130 = _116 * _116;
    float _132 = -_104;
    float _134 = fma(_128, _72, _132);
    float _136 = -_106;
    float _138 = fma(_128, _76, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_102;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = fma(_124, _124, _140);
    float _150 = fma(_138, _138, _146);
    float _152 = fma(_144, _144, _150);
    float _154 = rsqrt(_148);
    float _156 = rsqrt(_152);
    float _158 = _120 * _154;
    float _160 = _124 * _154;
    float _162 = _116 * _154;
    float _164 = _144 * _156;
    float _166 = _134 * _156;
    float _168 = _138 * _156;
    float _170 = _158 * _164;
    float _172 = _160 * _166;
    float _174 = -_170;
    float _176 = fma(_160, _168, _174);
    float _178 = _162 * _168;
    float _180 = -_172;
    float _182 = fma(_162, _164, _180);
    float _184 = _176 * _176;
    float _186 = -_178;
    float _188 = fma(_158, _166, _186);
    float _190 = fma(_182, _182, _184);
    float _192 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _194 = _112 * _192;
    float _196 = fma(_188, _188, _190);
    float _198 = -_194;
    bool _202 = _198 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _204 = -_194;
    bool _206 = _204 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _208 = rsqrt(_196);
    bool _210 = !_202;
    uint _213 = uint(_210 ? 0 : 1);
    uint _215 = 2u;
    if (!_202)
    {
        _215 = 1u;
    }
    uint _217 = _215;
    uint _219 = _217;
    if (!_206)
    {
        _219 = _213;
    }
    uint _221 = _219;
    float _223 = _176 * _208;
    float _225 = _182 * _208;
    uint _227 = min(_221, 2u);
    float _229 = _188 * _208;
    float _231 = _223 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _234 = int(_227) << 2;
    float _236 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[35].x, _231);
    float _238 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[35].z, _236);
    uint _240 = uint(int(uint(_234) >> uint(2)));
    uint _242 = uint(int(uint(int(_240)) >> uint(2)));
    int _244 = int(_240) & 3;
    float _246 = (*spvDescriptorSet0.fp_c1)._m0[int(_242)][_244];
    float _248 = abs(_238);
    float _250 = -_248;
    float _252 = _250 + 1.0;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = abs(_254);
    float _258 = log2(_256);
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _262 = exp2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _266 = _223 * _264;
    float _268 = _225 * _264;
    float _270 = fma(_229, _264, _194);
    float _272 = fma(_194, _66, _266);
    float _274 = fma(_194, _70, _268);
    bool _276 = as_type<int>(_246) == 1344;
    if (!_276)
    {
        bool _278 = as_type<int>(_246) == 1616;
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
            float _292 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].x, _284);
            float _294 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].x, _286);
            float _296 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].x, _288);
            float _298 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].x, _290);
            float _300 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].z, _292);
            float _302 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].z, _294);
            float _304 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _296);
            float _306 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].z, _298);
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
            float _332 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].x, _324);
            float _334 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].x, _326);
            float _336 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].x, _328);
            float _338 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].x, _330);
            float _340 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[4].z, _332);
            float _342 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[5].z, _334);
            float _344 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[6].z, _336);
            float _346 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[7].z, _338);
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
            float _364 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].x, _356);
            float _366 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].x, _358);
            float _368 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].x, _360);
            float _370 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].x, _362);
            float _372 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[8].z, _364);
            float _374 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[9].z, _366);
            float _376 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[10].z, _368);
            float _378 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[11].z, _370);
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
    float _398 = float(int(_221));
    float _400 = rint(_398);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    uint _406 = clamp(_404, 0u, 65535u);
    float _408 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _410 = _396 * _390;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = _396 * _392;
    float _416 = _396 * _394;
    float _418 = _412 * _408;
    float _420 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _422 = fma(_418, 0.5, _414);
    float _424 = _412 * _420;
    float _426 = fma(_418, 1.5, _414);
    float _428 = fma(_418, -0.5, _414);
    float _430 = fma(_424, 1.5, _416);
    float _432 = fma(_418, -1.5, _414);
    float3 _1226 = float3(_422, _430, float(int(_406)));
    float3 _1230 = select(_1226, float3(0.0), isnan(_1226));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1230.xy, uint(rint(_1230.z)), _412);
    float3 _1239 = float3(_426, _430, float(int(_406)));
    float3 _1241 = select(_1239, float3(0.0), isnan(_1239));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1241.xy, uint(rint(_1241.z)), _412);
    float3 _1250 = float3(_428, _430, float(int(_406)));
    float3 _1252 = select(_1250, float3(0.0), isnan(_1250));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1252.xy, uint(rint(_1252.z)), _412);
    float3 _1261 = float3(_432, _430, float(int(_406)));
    float3 _1263 = select(_1261, float3(0.0), isnan(_1261));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1263.xy, uint(rint(_1263.z)), _412);
    float _442 = fma(_424, 0.5, _416);
    float3 _1275 = float3(_426, _442, float(int(_406)));
    float3 _1277 = select(_1275, float3(0.0), isnan(_1275));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1277.xy, uint(rint(_1277.z)), _412);
    float3 _1286 = float3(_422, _442, float(int(_406)));
    float3 _1288 = select(_1286, float3(0.0), isnan(_1286));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1288.xy, uint(rint(_1288.z)), _412);
    float3 _1297 = float3(_428, _442, float(int(_406)));
    float3 _1299 = select(_1297, float3(0.0), isnan(_1297));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1299.xy, uint(rint(_1299.z)), _412);
    float _450 = fma(_424, -0.5, _416);
    float3 _1311 = float3(_432, _442, float(int(_406)));
    float3 _1313 = select(_1311, float3(0.0), isnan(_1311));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1313.xy, uint(rint(_1313.z)), _412);
    float3 _1322 = float3(_426, _450, float(int(_406)));
    float3 _1324 = select(_1322, float3(0.0), isnan(_1322));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1324.xy, uint(rint(_1324.z)), _412);
    float3 _1333 = float3(_422, _450, float(int(_406)));
    float3 _1335 = select(_1333, float3(0.0), isnan(_1333));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1335.xy, uint(rint(_1335.z)), _412);
    float3 _1344 = float3(_428, _450, float(int(_406)));
    float3 _1346 = select(_1344, float3(0.0), isnan(_1344));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1346.xy, uint(rint(_1346.z)), _412);
    float _460 = fma(_424, -1.5, _416);
    float3 _1358 = float3(_432, _450, float(int(_406)));
    float3 _1360 = select(_1358, float3(0.0), isnan(_1358));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1360.xy, uint(rint(_1360.z)), _412);
    float3 _1369 = float3(_426, _460, float(int(_406)));
    float3 _1371 = select(_1369, float3(0.0), isnan(_1369));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1371.xy, uint(rint(_1371.z)), _412);
    float3 _1380 = float3(_422, _460, float(int(_406)));
    float3 _1382 = select(_1380, float3(0.0), isnan(_1380));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1382.xy, uint(rint(_1382.z)), _412);
    float3 _1391 = float3(_428, _460, float(int(_406)));
    float3 _1393 = select(_1391, float3(0.0), isnan(_1391));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1393.xy, uint(rint(_1393.z)), _412);
    float3 _1402 = float3(_432, _460, float(int(_406)));
    float3 _1404 = select(_1402, float3(0.0), isnan(_1402));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1404.xy, uint(rint(_1404.z)), _412);
    float _472 = _436 + _434;
    float _474 = -_194;
    float _476 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _478 = _474 + _476;
    float _480 = _472 + _438;
    float _482 = _478 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _484 = precise::clamp(_482, 0.0, 1.0);
    float _486 = _480 + _440;
    float _488 = -_194;
    float _490 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _492 = _488 + _490;
    float _494 = _486 + _444;
    float _496 = _492 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = _494 + _446;
    float _502 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[48].w, _498);
    float _504 = _500 + _448;
    float _506 = _504 + _452;
    float _508 = _506 + _454;
    float _510 = _508 + _456;
    float _512 = _510 + _458;
    float _514 = _512 + _462;
    float _516 = _514 + _464;
    float _518 = _516 + _466;
    float _520 = _518 + _468;
    float _522 = _520 + _470;
    float _524 = fma(_522, 0.0625, _484);
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _524;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _502;
    return out;
}

