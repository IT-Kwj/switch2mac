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
    bool _276 = false;
    bool _274 = false;
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _495 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _512 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_512, float2(0.0), isnan(_512))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_512, float2(0.0), isnan(_512))).x;
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
    float _96 = -_64;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _66 * _82;
    float _104 = _68 * _82;
    float _106 = -_102;
    float _108 = fma(_88, _70, _106);
    float _110 = -_102;
    float _112 = fma(_94, _72, _110);
    float _114 = -_104;
    float _116 = fma(_88, _74, _114);
    float _118 = -_104;
    float _120 = fma(_94, _76, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_82;
    float _128 = _126 + _88;
    float _130 = -_82;
    float _132 = _130 + _94;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = -_100;
    bool _142 = _138 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _144 = fma(_128, _128, _134);
    float _146 = fma(_132, _132, _136);
    float _148 = -_100;
    bool _150 = _148 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _152 = -_100;
    bool _154 = _152 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _156 = rsqrt(_144);
    int _159 = 2;
    if (!_142)
    {
        _159 = 1;
    }
    int _161 = _159;
    float _163 = rsqrt(_146);
    float _165 = _116 * _156;
    float _167 = _128 * _156;
    float _169 = _108 * _156;
    float _171 = _132 * _163;
    float _173 = _120 * _163;
    float _175 = _112 * _163;
    float _177 = _165 * _171;
    float _179 = _169 * _173;
    float _181 = _167 * _175;
    float _183 = -_177;
    float _185 = fma(_167, _173, _183);
    float _187 = -_179;
    float _189 = fma(_165, _175, _187);
    float _191 = -_181;
    float _193 = fma(_169, _171, _191);
    bool _195 = !_142;
    int _197 = _195 ? 0 : 1;
    float _199 = _185 * _185;
    int _201 = _161;
    if (!_150)
    {
        _201 = _197;
    }
    int _203 = _201;
    float _205 = fma(_193, _193, _199);
    int _207 = _203 + 1;
    float _209 = fma(_189, _189, _205);
    uint _212 = uint(_207);
    if (!_154)
    {
        _212 = uint(_203);
    }
    uint _214 = _212;
    uint _216 = min(_214, 2u);
    float _218 = rsqrt(_209);
    int _220 = int(_216) << 2;
    float _222 = _185 * _218;
    float _224 = _193 * _218;
    float _226 = _189 * _218;
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _230 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[35].x, _228);
    float _232 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].z, _230);
    uint _234 = uint(int(uint(_220) >> uint(2)));
    uint _236 = uint(int(uint(int(_234)) >> uint(2)));
    int _238 = int(_234) & 3;
    float _240 = (*spvDescriptorSet0.fp_c1)._m0[int(_236)][_238];
    float _242 = abs(_232);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = abs(_248);
    float _252 = log2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _256 = exp2(_254);
    float _258 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _260 = _222 * _258;
    float _262 = _224 * _258;
    float _264 = fma(_226, _258, _100);
    float _266 = fma(_100, _66, _260);
    float _268 = fma(_100, _68, _262);
    bool _270 = as_type<int>(_240) == 1248;
    if (!_270)
    {
        bool _272 = as_type<int>(_240) == 1520;
        _274 = _272;
        if (!_274)
        {
            _276 = true;
        }
    }
    float _310;
    float _312;
    float _314;
    float _316;
    if (!_274)
    {
        if (!_276)
        {
            float _278 = _266 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _280 = _266 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _282 = _266 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _284 = _266 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _286 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].x, _278);
            float _288 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[1].x, _280);
            float _290 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].x, _282);
            float _292 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[3].x, _284);
            float _294 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].z, _286);
            float _296 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[1].z, _288);
            float _298 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[2].z, _290);
            float _300 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[3].z, _292);
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _310 = _308;
            _312 = _306;
            _314 = _304;
            _316 = _302;
        }
    }
    if ((false || _276) || _274)
    {
        if ((!_276) || _274)
        {
            _274 = false;
            float _318 = _266 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _320 = _266 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _322 = _266 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _324 = _266 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _326 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[4].x, _318);
            float _328 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[5].x, _320);
            float _330 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[6].x, _322);
            float _332 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[7].x, _324);
            float _334 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[4].z, _326);
            float _336 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[5].z, _328);
            float _338 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[6].z, _330);
            float _340 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[7].z, _332);
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _310 = _348;
            _312 = _346;
            _314 = _344;
            _316 = _342;
        }
        if (false || _276)
        {
            _276 = false;
            float _350 = _266 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _352 = _266 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _354 = _266 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _356 = _266 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _358 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[8].x, _350);
            float _360 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[9].x, _352);
            float _362 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[10].x, _354);
            float _364 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[11].x, _356);
            float _366 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[8].z, _358);
            float _368 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[9].z, _360);
            float _370 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[10].z, _362);
            float _372 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[11].z, _364);
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _310 = _380;
            _312 = _378;
            _314 = _376;
            _316 = _374;
        }
    }
    float _382 = _310;
    float _384 = _312;
    float _386 = _314;
    float _388 = _316;
    float _390 = float(int(_214));
    float _392 = 1.0 / _382;
    float _394 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _396 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _398 = rint(_390);
    float _400 = precise::max(_398, 0.0);
    uint _402 = uint(_400);
    uint _404 = clamp(_402, 0u, 65535u);
    float _406 = _392 * _384;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = _392 * _386;
    float _412 = _392 * _388;
    float _414 = fma(_408, _396, _410);
    float _416 = fma(_408, _394, _412);
    float _418 = -_394;
    float _420 = fma(_408, _418, _412);
    float _422 = -_396;
    float _424 = fma(_408, _422, _410);
    float3 _1179 = float3(_412, _414, float(int(_404)));
    float3 _1183 = select(_1179, float3(0.0), isnan(_1179));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1183.xy, uint(rint(_1183.z)), _408);
    float3 _1192 = float3(_416, _414, float(int(_404)));
    float3 _1194 = select(_1192, float3(0.0), isnan(_1192));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1194.xy, uint(rint(_1194.z)), _408);
    float3 _1203 = float3(_420, _414, float(int(_404)));
    float3 _1205 = select(_1203, float3(0.0), isnan(_1203));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1205.xy, uint(rint(_1205.z)), _408);
    float3 _1214 = float3(_416, _410, float(int(_404)));
    float3 _1216 = select(_1214, float3(0.0), isnan(_1214));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1216.xy, uint(rint(_1216.z)), _408);
    float3 _1225 = float3(_412, _410, float(int(_404)));
    float3 _1227 = select(_1225, float3(0.0), isnan(_1225));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1227.xy, uint(rint(_1227.z)), _408);
    float3 _1236 = float3(_420, _410, float(int(_404)));
    float3 _1238 = select(_1236, float3(0.0), isnan(_1236));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1238.xy, uint(rint(_1238.z)), _408);
    float3 _1247 = float3(_416, _424, float(int(_404)));
    float3 _1249 = select(_1247, float3(0.0), isnan(_1247));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1249.xy, uint(rint(_1249.z)), _408);
    float3 _1258 = float3(_412, _424, float(int(_404)));
    float3 _1260 = select(_1258, float3(0.0), isnan(_1258));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1260.xy, uint(rint(_1260.z)), _408);
    float3 _1269 = float3(_420, _424, float(int(_404)));
    float3 _1271 = select(_1269, float3(0.0), isnan(_1269));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1271.xy, uint(rint(_1271.z)), _408);
    float _444 = -_100;
    float _446 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _448 = _444 + _446;
    float _450 = _428 + _426;
    float _452 = -_100;
    float _454 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _456 = _452 + _454;
    float _458 = _448 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _460 = precise::clamp(_458, 0.0, 1.0);
    float _462 = _450 + _430;
    float _464 = _456 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[48].w, _460);
    float _470 = _462 + _432;
    float _472 = _470 + _434;
    float _474 = _472 + _436;
    float _476 = _474 + _438;
    float _478 = _476 + _440;
    float _480 = _478 + _442;
    float _482 = fma(_480, 0.111111111938953399658203125, _466);
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _482;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _468;
    return out;
}

