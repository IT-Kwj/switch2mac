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
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _114 = false;
    bool _112 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _438 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_438, float2(0.0), isnan(_438))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_438, float2(0.0), isnan(_438))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = _64 * _54;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_64;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _78 = !_72;
    uint _81 = uint(_78 ? 0 : 1);
    uint _83 = 2u;
    if (!_72)
    {
        _83 = 1u;
    }
    uint _85 = _83;
    uint _87 = _85;
    if (!_76)
    {
        _87 = _81;
    }
    uint _89 = _87;
    uint _91 = min(_89, 2u);
    int _94 = int(_91) << 2;
    float _96 = in.m_38.x;
    uint _98 = uint(int(uint(_94) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.fp_c1)._m0[int(_100)][_102];
    float _106 = _64 * _96;
    bool _108 = as_type<int>(_104) == 368;
    if (!_108)
    {
        bool _110 = as_type<int>(_104) == 640;
        _112 = _110;
        if (!_112)
        {
            _114 = true;
        }
    }
    float _148;
    float _150;
    float _152;
    float _154;
    if (!_112)
    {
        if (!_114)
        {
            float _116 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _144;
            _152 = _140;
            _154 = _142;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _66 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _66 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _66 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _66 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _184;
            _152 = _180;
            _154 = _182;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _66 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _66 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _66 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _66 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _216;
            _152 = _212;
            _154 = _214;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = 1.0 / _220;
    float _230 = float(int(_89));
    float _232 = rint(_230);
    float _234 = precise::max(_232, 0.0);
    uint _236 = uint(_234);
    uint _238 = clamp(_236, 0u, 65535u);
    float _240 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _242 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _244 = _228 * _222;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _228 * _224;
    float _250 = _228 * _226;
    float _252 = _246 * _240;
    float _254 = _246 * _242;
    float _256 = fma(_252, 0.5, _248);
    float _258 = fma(_254, 0.5, _250);
    float _260 = fma(_252, 1.5, _248);
    float _262 = fma(_252, -0.5, _248);
    float _264 = fma(_252, -1.5, _248);
    float _266 = fma(_254, 1.5, _250);
    float _268 = fma(_254, -0.5, _250);
    float3 _887 = float3(_256, _266, float(int(_238)));
    float3 _891 = select(_887, float3(0.0), isnan(_887));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _891.xy, uint(rint(_891.z)), _246);
    float3 _900 = float3(_260, _258, float(int(_238)));
    float3 _902 = select(_900, float3(0.0), isnan(_900));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _902.xy, uint(rint(_902.z)), _246);
    float3 _911 = float3(_256, _258, float(int(_238)));
    float3 _913 = select(_911, float3(0.0), isnan(_911));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _913.xy, uint(rint(_913.z)), _246);
    float3 _922 = float3(_262, _258, float(int(_238)));
    float3 _924 = select(_922, float3(0.0), isnan(_922));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _924.xy, uint(rint(_924.z)), _246);
    float3 _933 = float3(_264, _258, float(int(_238)));
    float3 _935 = select(_933, float3(0.0), isnan(_933));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _935.xy, uint(rint(_935.z)), _246);
    float3 _944 = float3(_260, _268, float(int(_238)));
    float3 _946 = select(_944, float3(0.0), isnan(_944));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _946.xy, uint(rint(_946.z)), _246);
    float3 _955 = float3(_262, _266, float(int(_238)));
    float3 _957 = select(_955, float3(0.0), isnan(_955));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _957.xy, uint(rint(_957.z)), _246);
    float3 _966 = float3(_264, _266, float(int(_238)));
    float3 _968 = select(_966, float3(0.0), isnan(_966));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _968.xy, uint(rint(_968.z)), _246);
    float3 _977 = float3(_260, _266, float(int(_238)));
    float3 _979 = select(_977, float3(0.0), isnan(_977));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _979.xy, uint(rint(_979.z)), _246);
    float3 _988 = float3(_256, _268, float(int(_238)));
    float3 _990 = select(_988, float3(0.0), isnan(_988));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _990.xy, uint(rint(_990.z)), _246);
    float3 _999 = float3(_262, _268, float(int(_238)));
    float3 _1001 = select(_999, float3(0.0), isnan(_999));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1001.xy, uint(rint(_1001.z)), _246);
    float3 _1010 = float3(_264, _268, float(int(_238)));
    float3 _1012 = select(_1010, float3(0.0), isnan(_1010));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1012.xy, uint(rint(_1012.z)), _246);
    float _294 = _66 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _296 = fma(_254, -1.5, _250);
    float _298 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[15].x, _294);
    float _300 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _298);
    float _302 = _300 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _304 = _66 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _306 = _66 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _308 = 1.0 / _302;
    float _310 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[12].x, _304);
    float _312 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[13].x, _306);
    float _314 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _310);
    float _316 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _312);
    float _318 = _314 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _320 = _316 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _322 = _318 * _308;
    float _324 = _320 * _308;
    float2 _1086 = float2(_322, _324);
    float2 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1086, float2(0.0), isnan(_1086))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1086, float2(0.0), isnan(_1086))).xy;
    float _330 = _328.x;
    float _332 = _328.y;
    float3 _1101 = float3(_260, _296, float(int(_238)));
    float3 _1103 = select(_1101, float3(0.0), isnan(_1101));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1103.xy, uint(rint(_1103.z)), _246);
    float3 _1112 = float3(_256, _296, float(int(_238)));
    float3 _1114 = select(_1112, float3(0.0), isnan(_1112));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1114.xy, uint(rint(_1114.z)), _246);
    float3 _1123 = float3(_262, _296, float(int(_238)));
    float3 _1125 = select(_1123, float3(0.0), isnan(_1123));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1125.xy, uint(rint(_1125.z)), _246);
    float3 _1134 = float3(_264, _296, float(int(_238)));
    float3 _1136 = select(_1134, float3(0.0), isnan(_1134));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1136.xy, uint(rint(_1136.z)), _246);
    float _342 = _66 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _344 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[14].x, _342);
    float _346 = -_64;
    float _348 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _350 = _346 + _348;
    float _352 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _344);
    float _354 = _350 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _352 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _360 = precise::min(_358, 1.0);
    float _362 = _286 + _270;
    float _364 = _362 + _282;
    float _366 = _364 + _284;
    float _368 = _366 + _272;
    float _370 = _368 + _274;
    float _372 = _370 + _276;
    float _374 = _372 + _278;
    float _376 = _374 + _280;
    float _378 = _376 + _288;
    float _380 = _378 + _290;
    float _382 = _380 + _292;
    float _384 = -_64;
    float _386 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _388 = _384 + _386;
    float _390 = _388 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = -_330;
    float _396 = fma(_394, _330, _332);
    float _398 = -_330;
    float _400 = _360 + _398;
    float _402 = fma(_400, _400, _396);
    float _404 = _382 + _334;
    bool _406 = _400 <= 0.001000000047497451305389404296875;
    float _408 = float(_406);
    float _410 = 1.0 / _402;
    float _412 = _404 + _336;
    float _414 = _412 + _338;
    float _416 = _396 * _410;
    float _418 = precise::max(_416, _408);
    float _420 = _414 + _340;
    float _422 = precise::min(_418, 1.0);
    float _424 = fma(_420, 0.0625, _356);
    float _426 = _422 + _392;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _424;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _426;
    return out;
}

