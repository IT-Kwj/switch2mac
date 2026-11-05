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
    bool _110 = false;
    bool _108 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _398 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_398, float2(0.0), isnan(_398))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_398, float2(0.0), isnan(_398))).x;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _54;
    float _66 = -_62;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = _62 * _56;
    float _74 = -_62;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _78 = !_70;
    uint _81 = uint(_78 ? 0 : 1);
    uint _83 = 2u;
    if (!_70)
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
    uint _96 = uint(int(uint(_94) >> uint(2)));
    uint _98 = uint(int(uint(int(_96)) >> uint(2)));
    int _100 = int(_96) & 3;
    float _102 = (*spvDescriptorSet0.fp_c1)._m0[int(_98)][_100];
    bool _104 = as_type<int>(_102) == 336;
    if (!_104)
    {
        bool _106 = as_type<int>(_102) == 608;
        _108 = _106;
        if (!_108)
        {
            _110 = true;
        }
    }
    float _144;
    float _146;
    float _148;
    float _150;
    if (!_108)
    {
        if (!_110)
        {
            float _112 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _114 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _116 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _118 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _120 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _112);
            float _122 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _114);
            float _124 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _116);
            float _126 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _118);
            float _128 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _120);
            float _130 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _122);
            float _132 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _124);
            float _134 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _126);
            float _136 = _128 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _144 = _142;
            _146 = _136;
            _148 = _140;
            _150 = _138;
        }
    }
    if ((false || _110) || _108)
    {
        if ((!_110) || _108)
        {
            _108 = false;
            float _152 = _72 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _154 = _72 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _156 = _72 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _158 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _160 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, _152);
            float _162 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].x, _154);
            float _164 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].x, _156);
            float _166 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].x, _158);
            float _168 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _160);
            float _170 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _162);
            float _172 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _164);
            float _174 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _166);
            float _176 = _168 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _144 = _182;
            _146 = _176;
            _148 = _180;
            _150 = _178;
        }
        if (false || _110)
        {
            _110 = false;
            float _184 = _72 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _186 = _72 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _188 = _72 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _190 = _72 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _192 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].x, _184);
            float _194 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].x, _186);
            float _196 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].x, _188);
            float _198 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].x, _190);
            float _200 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _192);
            float _202 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _194);
            float _204 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _196);
            float _206 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _198);
            float _208 = _200 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _144 = _214;
            _146 = _208;
            _148 = _212;
            _150 = _210;
        }
    }
    float _216 = _144;
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _72 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _226 = float(int(_89));
    float _228 = 1.0 / _216;
    float _230 = _72 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _232 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _224);
    float _234 = _72 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _236 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _230);
    float _238 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _232);
    float _240 = rint(_226);
    float _242 = precise::max(_240, 0.0);
    uint _244 = uint(_242);
    uint _246 = clamp(_244, 0u, 65535u);
    float _248 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _236);
    float _250 = _238 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _252 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _234);
    float _254 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _256 = _248 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _258 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _252);
    float _260 = 1.0 / _250;
    float _262 = _228 * _218;
    float _264 = _228 * _220;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _258 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _270 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _272 = _228 * _222;
    float _274 = fma(_266, _270, _262);
    float _276 = -_270;
    float _278 = fma(_266, _276, _262);
    float _280 = fma(_266, _254, _272);
    float _282 = -_254;
    float _284 = fma(_266, _282, _272);
    float _286 = _256 * _260;
    float _288 = _268 * _260;
    float3 _897 = float3(_262, _280, float(int(_246)));
    float3 _901 = select(_897, float3(0.0), isnan(_897));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _901.xy, uint(rint(_901.z)), _266);
    float3 _910 = float3(_274, _280, float(int(_246)));
    float3 _912 = select(_910, float3(0.0), isnan(_910));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _912.xy, uint(rint(_912.z)), _266);
    float3 _921 = float3(_278, _280, float(int(_246)));
    float3 _923 = select(_921, float3(0.0), isnan(_921));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _923.xy, uint(rint(_923.z)), _266);
    float3 _932 = float3(_274, _272, float(int(_246)));
    float3 _934 = select(_932, float3(0.0), isnan(_932));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _934.xy, uint(rint(_934.z)), _266);
    float3 _943 = float3(_262, _272, float(int(_246)));
    float3 _945 = select(_943, float3(0.0), isnan(_943));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _945.xy, uint(rint(_945.z)), _266);
    float2 _951 = float2(_288, _286);
    float2 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_951, float2(0.0), isnan(_951))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_951, float2(0.0), isnan(_951))).xy;
    float _304 = _302.x;
    float _306 = _302.y;
    float3 _966 = float3(_278, _272, float(int(_246)));
    float3 _968 = select(_966, float3(0.0), isnan(_966));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _968.xy, uint(rint(_968.z)), _266);
    float3 _977 = float3(_274, _284, float(int(_246)));
    float3 _979 = select(_977, float3(0.0), isnan(_977));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _979.xy, uint(rint(_979.z)), _266);
    float3 _988 = float3(_262, _284, float(int(_246)));
    float3 _990 = select(_988, float3(0.0), isnan(_988));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _990.xy, uint(rint(_990.z)), _266);
    float3 _999 = float3(_278, _284, float(int(_246)));
    float3 _1001 = select(_999, float3(0.0), isnan(_999));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1001.xy, uint(rint(_1001.z)), _266);
    float _316 = _72 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _318 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _316);
    float _320 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _318);
    float _322 = _320 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _324 = precise::min(_322, 1.0);
    float _326 = -_62;
    float _328 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _330 = _326 + _328;
    float _332 = -_62;
    float _334 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _336 = _332 + _334;
    float _338 = _330 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = _292 + _290;
    float _344 = _342 + _294;
    float _346 = -_304;
    float _348 = fma(_346, _304, _306);
    float _350 = -_304;
    float _352 = _324 + _350;
    float _354 = _344 + _296;
    float _356 = fma(_352, _352, _348);
    float _358 = _354 + _298;
    bool _360 = _352 <= 0.001000000047497451305389404296875;
    float _362 = float(_360);
    float _364 = _358 + _308;
    float _366 = 1.0 / _356;
    float _368 = _364 + _310;
    float _370 = _348 * _366;
    float _372 = _368 + _312;
    float _374 = _336 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = precise::max(_370, _362);
    float _380 = _372 + _314;
    float _382 = precise::min(_378, 1.0);
    float _384 = fma(_380, 0.111111111938953399658203125, _340);
    float _386 = _382 + _376;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _384;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _386;
    return out;
}

