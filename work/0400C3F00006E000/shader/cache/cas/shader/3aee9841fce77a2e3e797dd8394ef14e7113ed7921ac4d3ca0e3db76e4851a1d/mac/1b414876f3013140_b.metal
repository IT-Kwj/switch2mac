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
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
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
    bool _112 = false;
    bool _110 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _380 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_380, float2(0.0), isnan(_380))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_380, float2(0.0), isnan(_380))).x;
    float _56 = in.m_40.x;
    float _58 = -_54;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _56;
    float _66 = -_62;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = -_62;
    bool _74 = _72 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _76 = !_70;
    uint _79 = uint(_76 ? 0 : 1);
    uint _81 = 2u;
    if (!_70)
    {
        _81 = 1u;
    }
    uint _83 = _81;
    uint _85 = _83;
    if (!_74)
    {
        _85 = _79;
    }
    uint _87 = _85;
    uint _89 = min(_87, 2u);
    int _92 = int(_89) << 2;
    float _94 = in.m_40.y;
    uint _96 = uint(int(uint(_92) >> uint(2)));
    uint _98 = uint(int(uint(int(_96)) >> uint(2)));
    int _100 = int(_96) & 3;
    float _102 = (*spvDescriptorSet0.fp_c1)._m0[int(_98)][_100];
    float _104 = _62 * _94;
    bool _106 = as_type<int>(_102) == 336;
    if (!_106)
    {
        bool _108 = as_type<int>(_102) == 608;
        _110 = _108;
        if (!_110)
        {
            _112 = true;
        }
    }
    float _146;
    float _148;
    float _150;
    float _152;
    if (!_110)
    {
        if (!_112)
        {
            float _114 = _104 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _116 = _104 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _118 = _104 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _120 = _104 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _122 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _114);
            float _124 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _116);
            float _126 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _118);
            float _128 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _120);
            float _130 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _122);
            float _132 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _124);
            float _134 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _126);
            float _136 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _128);
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _146 = _144;
            _148 = _142;
            _150 = _138;
            _152 = _140;
        }
    }
    if ((false || _112) || _110)
    {
        if ((!_112) || _110)
        {
            _110 = false;
            float _154 = _104 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _156 = _104 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _158 = _104 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _160 = _104 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _162 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, _154);
            float _164 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].x, _156);
            float _166 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].x, _158);
            float _168 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].x, _160);
            float _170 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _162);
            float _172 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _164);
            float _174 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _166);
            float _176 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _168);
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _146 = _184;
            _148 = _182;
            _150 = _178;
            _152 = _180;
        }
        if (false || _112)
        {
            _112 = false;
            float _186 = _104 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _188 = _104 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _190 = _104 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _192 = _104 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _194 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].x, _186);
            float _196 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].x, _188);
            float _198 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].x, _190);
            float _200 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].x, _192);
            float _202 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _194);
            float _204 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _196);
            float _206 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _198);
            float _208 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _200);
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _146 = _216;
            _148 = _214;
            _150 = _210;
            _152 = _212;
        }
    }
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _104 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _228 = _104 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _230 = 1.0 / _218;
    float _232 = float(int(_87));
    float _234 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _226);
    float _236 = _104 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _238 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _228);
    float _240 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _234);
    float _242 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _238);
    float _244 = rint(_232);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    uint _250 = clamp(_248, 0u, 65535u);
    float _252 = _240 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _254 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _236);
    float _256 = _242 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _258 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _254);
    float _260 = _230 * _220;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = 1.0 / _252;
    float _266 = _230 * _222;
    float _268 = _258 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _270 = _262 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _272 = _230 * _224;
    float _274 = _270 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _276 = _270 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _278 = fma(_276, 0.5, _272);
    float _280 = _268 * _264;
    float _282 = _256 * _264;
    float _284 = fma(_274, 0.5, _266);
    float _286 = fma(_274, -0.5, _266);
    float _288 = fma(_276, -0.5, _272);
    float2 _871 = float2(_280, _282);
    float2 _292 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_871, float2(0.0), isnan(_871))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_871, float2(0.0), isnan(_871))).xy;
    float _294 = _292.x;
    float _296 = _292.y;
    float3 _887 = float3(_286, _278, float(int(_250)));
    float3 _891 = select(_887, float3(0.0), isnan(_887));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _891.xy, uint(rint(_891.z)), _262);
    float3 _900 = float3(_284, _278, float(int(_250)));
    float3 _902 = select(_900, float3(0.0), isnan(_900));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _902.xy, uint(rint(_902.z)), _262);
    float3 _911 = float3(_284, _288, float(int(_250)));
    float3 _913 = select(_911, float3(0.0), isnan(_911));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _913.xy, uint(rint(_913.z)), _262);
    float3 _922 = float3(_286, _288, float(int(_250)));
    float3 _924 = select(_922, float3(0.0), isnan(_922));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _924.xy, uint(rint(_924.z)), _262);
    float2 _930 = float2(_50, _52);
    float _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_930, float2(0.0), isnan(_930))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_930, float2(0.0), isnan(_930))).x;
    float _308 = _104 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _310 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _308);
    float _312 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _310);
    float _314 = _312 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _316 = precise::min(_314, 1.0);
    float _318 = -_62;
    float _320 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _322 = _318 + _320;
    float _324 = -_62;
    float _326 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _328 = _324 + _326;
    float _330 = _322 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = -_294;
    float _336 = fma(_334, _294, _296);
    float _338 = -_294;
    float _340 = _316 + _338;
    float _342 = fma(_340, _340, _336);
    float _344 = _300 + _298;
    bool _346 = _340 <= 0.001000000047497451305389404296875;
    float _348 = float(_346);
    float _350 = 1.0 / _342;
    float _352 = _344 + _302;
    float _354 = _352 + _304;
    float _356 = fma(_354, 0.25, _332);
    float _358 = _336 * _350;
    float _360 = _328 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = precise::max(_358, _348);
    float _366 = precise::min(_364, 1.0);
    float _368 = _366 + _362;
    out.m_43.x = _306;
    out.m_43.y = _356;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _368;
    return out;
}

