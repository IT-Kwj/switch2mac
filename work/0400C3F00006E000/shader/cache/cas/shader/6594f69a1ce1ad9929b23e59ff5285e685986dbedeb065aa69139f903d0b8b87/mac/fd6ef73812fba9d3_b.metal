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
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _116 = false;
    bool _114 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _442 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_442, float2(0.0), isnan(_442))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_442, float2(0.0), isnan(_442))).x;
    float _56 = in.m_40.x;
    float _58 = -_54;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = in.m_40.y;
    float _70 = _66 * _56;
    float _72 = -_66;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _82 = !_76;
    uint _85 = uint(_82 ? 0 : 1);
    uint _87 = 2u;
    if (!_76)
    {
        _87 = 1u;
    }
    uint _89 = _87;
    uint _91 = _89;
    if (!_80)
    {
        _91 = _85;
    }
    uint _93 = _91;
    uint _95 = min(_93, 2u);
    int _98 = int(_95) << 2;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    float _108 = _66 * _68;
    bool _110 = as_type<int>(_106) == 368;
    if (!_110)
    {
        bool _112 = as_type<int>(_106) == 640;
        _114 = _112;
        if (!_114)
        {
            _116 = true;
        }
    }
    float _150;
    float _152;
    float _154;
    float _156;
    if (!_114)
    {
        if (!_116)
        {
            float _118 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _108 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _108 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _108 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _146;
            _154 = _142;
            _156 = _144;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _108 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _108 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _108 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _108 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _186;
            _154 = _182;
            _156 = _184;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _108 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _108 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _108 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _108 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _218;
            _154 = _214;
            _156 = _216;
        }
    }
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = 1.0 / _222;
    float _232 = float(int(_93));
    float _234 = rint(_232);
    float _236 = precise::max(_234, 0.0);
    uint _238 = uint(_236);
    uint _240 = clamp(_238, 0u, 65535u);
    float _242 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _244 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _246 = _230 * _224;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _230 * _226;
    float _252 = _230 * _228;
    float _254 = _248 * _242;
    float _256 = _248 * _244;
    float _258 = fma(_254, 0.5, _250);
    float _260 = fma(_256, 0.5, _252);
    float _262 = fma(_256, 1.5, _252);
    float _264 = fma(_254, -0.5, _250);
    float _266 = fma(_254, 1.5, _250);
    float3 _884 = float3(_258, _262, float(int(_240)));
    float3 _888 = select(_884, float3(0.0), isnan(_884));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _888.xy, uint(rint(_888.z)), _248);
    float3 _897 = float3(_264, _262, float(int(_240)));
    float3 _899 = select(_897, float3(0.0), isnan(_897));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _899.xy, uint(rint(_899.z)), _248);
    float3 _908 = float3(_266, _260, float(int(_240)));
    float3 _910 = select(_908, float3(0.0), isnan(_908));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _910.xy, uint(rint(_910.z)), _248);
    float3 _919 = float3(_258, _260, float(int(_240)));
    float3 _921 = select(_919, float3(0.0), isnan(_919));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _921.xy, uint(rint(_921.z)), _248);
    float3 _930 = float3(_264, _260, float(int(_240)));
    float3 _932 = select(_930, float3(0.0), isnan(_930));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _932.xy, uint(rint(_932.z)), _248);
    float _278 = fma(_254, -1.5, _250);
    float _280 = fma(_256, -0.5, _252);
    float3 _948 = float3(_278, _260, float(int(_240)));
    float3 _950 = select(_948, float3(0.0), isnan(_948));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _950.xy, uint(rint(_950.z)), _248);
    float3 _959 = float3(_258, _280, float(int(_240)));
    float3 _961 = select(_959, float3(0.0), isnan(_959));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _961.xy, uint(rint(_961.z)), _248);
    float3 _970 = float3(_278, _262, float(int(_240)));
    float3 _972 = select(_970, float3(0.0), isnan(_970));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _972.xy, uint(rint(_972.z)), _248);
    float3 _981 = float3(_266, _262, float(int(_240)));
    float3 _983 = select(_981, float3(0.0), isnan(_981));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _983.xy, uint(rint(_983.z)), _248);
    float3 _992 = float3(_266, _280, float(int(_240)));
    float3 _994 = select(_992, float3(0.0), isnan(_992));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _994.xy, uint(rint(_994.z)), _248);
    float3 _1003 = float3(_264, _280, float(int(_240)));
    float3 _1005 = select(_1003, float3(0.0), isnan(_1003));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1005.xy, uint(rint(_1005.z)), _248);
    float3 _1014 = float3(_278, _280, float(int(_240)));
    float3 _1016 = select(_1014, float3(0.0), isnan(_1014));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1016.xy, uint(rint(_1016.z)), _248);
    float _296 = fma(_256, -1.5, _252);
    float _298 = _108 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _300 = _108 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _302 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _298);
    float _304 = _108 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _306 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _300);
    float _308 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _302);
    float _310 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _304);
    float _312 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _306);
    float _314 = _308 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _316 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _310);
    float _318 = _312 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _320 = 1.0 / _314;
    float _322 = _316 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _324 = _322 * _320;
    float _326 = _318 * _320;
    float2 _1090 = float2(_324, _326);
    float2 _330 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1090, float2(0.0), isnan(_1090))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1090, float2(0.0), isnan(_1090))).xy;
    float _332 = _330.x;
    float _334 = _330.y;
    float3 _1105 = float3(_266, _296, float(int(_240)));
    float3 _1107 = select(_1105, float3(0.0), isnan(_1105));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1107.xy, uint(rint(_1107.z)), _248);
    float3 _1116 = float3(_258, _296, float(int(_240)));
    float3 _1118 = select(_1116, float3(0.0), isnan(_1116));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1118.xy, uint(rint(_1118.z)), _248);
    float3 _1127 = float3(_264, _296, float(int(_240)));
    float3 _1129 = select(_1127, float3(0.0), isnan(_1127));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1129.xy, uint(rint(_1129.z)), _248);
    float3 _1138 = float3(_278, _296, float(int(_240)));
    float3 _1140 = select(_1138, float3(0.0), isnan(_1138));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1140.xy, uint(rint(_1140.z)), _248);
    float2 _1146 = float2(_50, _52);
    float _344 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1146, float2(0.0), isnan(_1146))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1146, float2(0.0), isnan(_1146))).x;
    float _346 = _108 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _348 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _346);
    float _350 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _348);
    float _352 = _350 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _354 = precise::min(_352, 1.0);
    float _356 = _288 + _268;
    float _358 = _356 + _270;
    float _360 = _358 + _286;
    float _362 = _360 + _272;
    float _364 = _362 + _274;
    float _366 = _364 + _276;
    float _368 = _366 + _282;
    float _370 = _368 + _290;
    float _372 = _370 + _284;
    float _374 = _372 + _292;
    float _376 = _374 + _294;
    float _378 = -_332;
    float _380 = fma(_378, _332, _334);
    float _382 = -_332;
    float _384 = _354 + _382;
    float _386 = _376 + _336;
    float _388 = fma(_384, _384, _380);
    float _390 = _386 + _338;
    bool _392 = _384 <= 0.001000000047497451305389404296875;
    float _394 = float(_392);
    float _396 = 1.0 / _388;
    float _398 = _390 + _340;
    float _400 = -_66;
    float _402 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _404 = _400 + _402;
    float _406 = _398 + _342;
    float _408 = _404 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _380 * _396;
    float _414 = -_66;
    float _416 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _418 = _414 + _416;
    float _420 = precise::max(_412, _394);
    float _422 = _418 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = precise::min(_420, 1.0);
    float _428 = fma(_406, 0.0625, _424);
    float _430 = _426 + _410;
    out.m_43.x = _344;
    out.m_43.y = _428;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _430;
    return out;
}

