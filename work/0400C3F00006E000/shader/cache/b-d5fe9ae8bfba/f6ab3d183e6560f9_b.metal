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
    float2 _309 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_309, float2(0.0), isnan(_309))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_309, float2(0.0), isnan(_309))).x;
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
            _146 = _140;
            _148 = _136;
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
            _146 = _180;
            _148 = _176;
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
            _146 = _212;
            _148 = _208;
            _150 = _210;
        }
    }
    float _216 = _144;
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = 1.0 / _216;
    float _226 = float(int(_89));
    float _228 = rint(_226);
    float _230 = precise::max(_228, 0.0);
    uint _232 = uint(_230);
    uint _234 = clamp(_232, 0u, 65535u);
    float _236 = _224 * _218;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = _224 * _220;
    float _242 = _224 * _222;
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _246 = _244 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _248 = _244 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _250 = fma(_246, 0.5, _240);
    float _252 = fma(_246, -0.5, _240);
    float _254 = fma(_248, 0.5, _242);
    float _256 = fma(_248, -0.5, _242);
    float3 _739 = float3(_252, _254, float(int(_234)));
    float3 _743 = select(_739, float3(0.0), isnan(_739));
    float _258 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _743.xy, uint(rint(_743.z)), _238);
    float3 _752 = float3(_250, _254, float(int(_234)));
    float3 _754 = select(_752, float3(0.0), isnan(_752));
    float _260 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _754.xy, uint(rint(_754.z)), _238);
    float3 _763 = float3(_250, _256, float(int(_234)));
    float3 _765 = select(_763, float3(0.0), isnan(_763));
    float _262 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _765.xy, uint(rint(_765.z)), _238);
    float3 _774 = float3(_252, _256, float(int(_234)));
    float3 _776 = select(_774, float3(0.0), isnan(_774));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _776.xy, uint(rint(_776.z)), _238);
    float2 _782 = float2(_48, _50);
    float _266 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_782, float2(0.0), isnan(_782))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_782, float2(0.0), isnan(_782))).x;
    float _268 = -_62;
    float _270 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _272 = _268 + _270;
    float _274 = -_62;
    float _276 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _278 = _274 + _276;
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _282 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _286 = _260 + _258;
    float _288 = _286 + _262;
    float _290 = _288 + _264;
    float _292 = _272 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = fma(_290, 0.25, _294);
    out.m_41.x = _266;
    out.m_41.y = _296;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _284;
    return out;
}

