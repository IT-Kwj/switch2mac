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
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
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
    float2 _376 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_376, float2(0.0), isnan(_376))).x;
    float _54 = in.m_38.y;
    float _56 = in.m_38.x;
    float _58 = -_52;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _56;
    float _66 = -_62;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = _62 * _54;
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
            _146 = _140;
            _148 = _138;
            _150 = _136;
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
            _146 = _180;
            _148 = _178;
            _150 = _176;
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
            _146 = _212;
            _148 = _210;
            _150 = _208;
        }
    }
    float _216 = _144;
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _72 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _226 = 1.0 / _216;
    float _228 = _72 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _230 = _72 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _232 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _224);
    float _234 = float(int(_89));
    float _236 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _228);
    float _238 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _232);
    float _240 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _236);
    float _242 = rint(_234);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = _238 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _252 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _230);
    float _254 = _240 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _256 = _226 * _218;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _252);
    float _262 = 1.0 / _250;
    float _264 = _226 * _220;
    float _266 = _258 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _268 = _260 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _270 = _226 * _222;
    float _272 = _266 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _274 = _266 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _276 = fma(_274, -0.5, _264);
    float _278 = _254 * _262;
    float _280 = _268 * _262;
    float _282 = fma(_272, 0.5, _270);
    float _284 = fma(_272, -0.5, _270);
    float _286 = fma(_274, 0.5, _264);
    float2 _867 = float2(_278, _280);
    float2 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_867, float2(0.0), isnan(_867))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_867, float2(0.0), isnan(_867))).xy;
    float _292 = _290.x;
    float _294 = _290.y;
    float3 _883 = float3(_284, _286, float(int(_248)));
    float3 _887 = select(_883, float3(0.0), isnan(_883));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _887.xy, uint(rint(_887.z)), _258);
    float3 _896 = float3(_282, _286, float(int(_248)));
    float3 _898 = select(_896, float3(0.0), isnan(_896));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _898.xy, uint(rint(_898.z)), _258);
    float3 _907 = float3(_282, _276, float(int(_248)));
    float3 _909 = select(_907, float3(0.0), isnan(_907));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _909.xy, uint(rint(_909.z)), _258);
    float3 _918 = float3(_284, _276, float(int(_248)));
    float3 _920 = select(_918, float3(0.0), isnan(_918));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _920.xy, uint(rint(_920.z)), _258);
    float _304 = _72 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _306 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _304);
    float _308 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _306);
    float _310 = _308 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _312 = precise::min(_310, 1.0);
    float _314 = -_62;
    float _316 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _318 = _314 + _316;
    float _320 = -_292;
    float _322 = fma(_320, _292, _294);
    float _324 = -_292;
    float _326 = _312 + _324;
    float _328 = fma(_326, _326, _322);
    bool _330 = _326 <= 0.001000000047497451305389404296875;
    float _332 = float(_330);
    float _334 = _298 + _296;
    float _336 = 1.0 / _328;
    float _338 = _334 + _300;
    float _340 = _322 * _336;
    float _342 = -_62;
    float _344 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _346 = _342 + _344;
    float _348 = precise::max(_340, _332);
    float _350 = _346 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _352 = precise::clamp(_350, 0.0, 1.0);
    float _354 = _338 + _302;
    float _356 = _318 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = precise::min(_348, 1.0);
    float _362 = fma(_354, 0.25, _352);
    float _364 = _360 + _358;
    out.m_41.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_41.y = _362;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _364;
    return out;
}

