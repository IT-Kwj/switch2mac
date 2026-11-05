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
    bool _266 = false;
    bool _264 = false;
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _521 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_521, float2(0.0), isnan(_521)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _538 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_538, float2(0.0), isnan(_538))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_36.x;
    float _70 = in.m_38.y;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _82 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].z, _80);
    float _84 = -_60;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_62;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = _66 * _82;
    float _98 = _68 * _82;
    float _100 = -_64;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = -_96;
    float _108 = fma(_88, _70, _106);
    float _110 = -_96;
    float _112 = fma(_94, _72, _110);
    float _114 = -_98;
    float _116 = fma(_88, _74, _114);
    float _118 = -_98;
    float _120 = fma(_94, _76, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_82;
    float _128 = _126 + _88;
    float _130 = -_82;
    float _132 = _130 + _94;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = -_104;
    bool _142 = _138 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _144 = fma(_128, _128, _134);
    float _146 = fma(_132, _132, _136);
    float _148 = -_104;
    bool _150 = _148 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _152 = !_142;
    uint _155 = uint(_152 ? 0 : 1);
    float _157 = rsqrt(_144);
    float _159 = rsqrt(_146);
    float _161 = _116 * _157;
    float _163 = _128 * _157;
    float _165 = _108 * _157;
    float _167 = _132 * _159;
    float _169 = _112 * _159;
    float _171 = _120 * _159;
    float _173 = _161 * _167;
    float _175 = _163 * _169;
    float _177 = -_173;
    float _179 = fma(_163, _171, _177);
    float _181 = _165 * _171;
    float _183 = -_175;
    float _185 = fma(_165, _167, _183);
    float _187 = _179 * _179;
    float _189 = -_181;
    float _191 = fma(_161, _169, _189);
    float _193 = fma(_185, _185, _187);
    uint _195 = 2u;
    if (!_142)
    {
        _195 = 1u;
    }
    uint _197 = _195;
    uint _199 = _197;
    if (!_150)
    {
        _199 = _155;
    }
    uint _201 = _199;
    float _203 = fma(_191, _191, _193);
    uint _205 = min(_201, 2u);
    float _207 = rsqrt(_203);
    int _210 = int(_205) << 2;
    float _212 = _179 * _207;
    float _214 = _185 * _207;
    float _216 = _191 * _207;
    float _218 = _212 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _220 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[35].x, _218);
    float _222 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[35].z, _220);
    uint _224 = uint(int(uint(_210) >> uint(2)));
    uint _226 = uint(int(uint(int(_224)) >> uint(2)));
    int _228 = int(_224) & 3;
    float _230 = (*spvDescriptorSet0.fp_c1)._m0[int(_226)][_228];
    float _232 = abs(_222);
    float _234 = -_232;
    float _236 = _234 + 1.0;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = abs(_238);
    float _242 = log2(_240);
    float _244 = _242 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _246 = exp2(_244);
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _250 = _214 * _248;
    float _252 = _212 * _248;
    float _254 = fma(_216, _248, _104);
    float _256 = fma(_104, _68, _250);
    float _258 = fma(_104, _66, _252);
    bool _260 = as_type<int>(_230) == 1200;
    if (!_260)
    {
        bool _262 = as_type<int>(_230) == 1472;
        _264 = _262;
        if (!_264)
        {
            _266 = true;
        }
    }
    float _300;
    float _302;
    float _304;
    float _306;
    if (!_264)
    {
        if (!_266)
        {
            float _268 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _270 = _258 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _272 = _258 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _274 = _258 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _276 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].x, _268);
            float _278 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[1].x, _270);
            float _280 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[2].x, _272);
            float _282 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[3].x, _274);
            float _284 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, _276);
            float _286 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[1].z, _278);
            float _288 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[2].z, _280);
            float _290 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[3].z, _282);
            float _292 = _284 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _294 = _286 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _300 = _298;
            _302 = _296;
            _304 = _292;
            _306 = _294;
        }
    }
    if ((false || _266) || _264)
    {
        if ((!_266) || _264)
        {
            _264 = false;
            float _308 = _258 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _310 = _258 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _312 = _258 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _314 = _258 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _316 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[4].x, _308);
            float _318 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[5].x, _310);
            float _320 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[6].x, _312);
            float _322 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[7].x, _314);
            float _324 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[4].z, _316);
            float _326 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[5].z, _318);
            float _328 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[6].z, _320);
            float _330 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[7].z, _322);
            float _332 = _324 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _334 = _326 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _300 = _338;
            _302 = _336;
            _304 = _332;
            _306 = _334;
        }
        if (false || _266)
        {
            _266 = false;
            float _340 = _258 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _342 = _258 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _344 = _258 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _346 = _258 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _348 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[8].x, _340);
            float _350 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[9].x, _342);
            float _352 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[10].x, _344);
            float _354 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[11].x, _346);
            float _356 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[8].z, _348);
            float _358 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[9].z, _350);
            float _360 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[10].z, _352);
            float _362 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[11].z, _354);
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _300 = _370;
            _302 = _368;
            _304 = _364;
            _306 = _366;
        }
    }
    float _372 = _300;
    float _374 = _302;
    float _376 = _304;
    float _378 = _306;
    float _380 = 1.0 / _372;
    float _382 = float(int(_201));
    float _384 = rint(_382);
    float _386 = precise::max(_384, 0.0);
    uint _388 = uint(_386);
    uint _390 = clamp(_388, 0u, 65535u);
    float _392 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _394 = _380 * _374;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = _380 * _376;
    float _400 = _380 * _378;
    float _402 = _396 * _392;
    float _404 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _406 = fma(_402, 0.5, _398);
    float _408 = _396 * _404;
    float _410 = fma(_402, 1.5, _398);
    float _412 = fma(_402, -0.5, _398);
    float _414 = fma(_408, 1.5, _400);
    float _416 = fma(_402, -1.5, _398);
    float3 _1194 = float3(_406, _414, float(int(_390)));
    float3 _1198 = select(_1194, float3(0.0), isnan(_1194));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1198.xy, uint(rint(_1198.z)), _396);
    float3 _1207 = float3(_410, _414, float(int(_390)));
    float3 _1209 = select(_1207, float3(0.0), isnan(_1207));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1209.xy, uint(rint(_1209.z)), _396);
    float3 _1218 = float3(_412, _414, float(int(_390)));
    float3 _1220 = select(_1218, float3(0.0), isnan(_1218));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1220.xy, uint(rint(_1220.z)), _396);
    float3 _1229 = float3(_416, _414, float(int(_390)));
    float3 _1231 = select(_1229, float3(0.0), isnan(_1229));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1231.xy, uint(rint(_1231.z)), _396);
    float _426 = fma(_408, 0.5, _400);
    float3 _1243 = float3(_410, _426, float(int(_390)));
    float3 _1245 = select(_1243, float3(0.0), isnan(_1243));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1245.xy, uint(rint(_1245.z)), _396);
    float3 _1254 = float3(_406, _426, float(int(_390)));
    float3 _1256 = select(_1254, float3(0.0), isnan(_1254));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1256.xy, uint(rint(_1256.z)), _396);
    float3 _1265 = float3(_412, _426, float(int(_390)));
    float3 _1267 = select(_1265, float3(0.0), isnan(_1265));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1267.xy, uint(rint(_1267.z)), _396);
    float _434 = fma(_408, -0.5, _400);
    float3 _1279 = float3(_416, _426, float(int(_390)));
    float3 _1281 = select(_1279, float3(0.0), isnan(_1279));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1281.xy, uint(rint(_1281.z)), _396);
    float3 _1290 = float3(_410, _434, float(int(_390)));
    float3 _1292 = select(_1290, float3(0.0), isnan(_1290));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1292.xy, uint(rint(_1292.z)), _396);
    float3 _1301 = float3(_406, _434, float(int(_390)));
    float3 _1303 = select(_1301, float3(0.0), isnan(_1301));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1303.xy, uint(rint(_1303.z)), _396);
    float3 _1312 = float3(_412, _434, float(int(_390)));
    float3 _1314 = select(_1312, float3(0.0), isnan(_1312));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1314.xy, uint(rint(_1314.z)), _396);
    float _444 = fma(_408, -1.5, _400);
    float3 _1326 = float3(_416, _434, float(int(_390)));
    float3 _1328 = select(_1326, float3(0.0), isnan(_1326));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1328.xy, uint(rint(_1328.z)), _396);
    float3 _1337 = float3(_410, _444, float(int(_390)));
    float3 _1339 = select(_1337, float3(0.0), isnan(_1337));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1339.xy, uint(rint(_1339.z)), _396);
    float3 _1348 = float3(_406, _444, float(int(_390)));
    float3 _1350 = select(_1348, float3(0.0), isnan(_1348));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1350.xy, uint(rint(_1350.z)), _396);
    float3 _1359 = float3(_412, _444, float(int(_390)));
    float3 _1361 = select(_1359, float3(0.0), isnan(_1359));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1361.xy, uint(rint(_1361.z)), _396);
    float3 _1370 = float3(_416, _444, float(int(_390)));
    float3 _1372 = select(_1370, float3(0.0), isnan(_1370));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1372.xy, uint(rint(_1372.z)), _396);
    float _456 = _420 + _418;
    float _458 = -_104;
    float _460 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _462 = _458 + _460;
    float _464 = _456 + _422;
    float _466 = _462 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = _464 + _424;
    float _472 = -_104;
    float _474 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _476 = _472 + _474;
    float _478 = _470 + _428;
    float _480 = _476 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = _478 + _430;
    float _486 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[48].w, _482);
    float _488 = _484 + _432;
    float _490 = _488 + _436;
    float _492 = _490 + _438;
    float _494 = _492 + _440;
    float _496 = _494 + _442;
    float _498 = _496 + _446;
    float _500 = _498 + _448;
    float _502 = _500 + _450;
    float _504 = _502 + _452;
    float _506 = _504 + _454;
    float _508 = fma(_506, 0.0625, _468);
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _508;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _486;
    return out;
}

