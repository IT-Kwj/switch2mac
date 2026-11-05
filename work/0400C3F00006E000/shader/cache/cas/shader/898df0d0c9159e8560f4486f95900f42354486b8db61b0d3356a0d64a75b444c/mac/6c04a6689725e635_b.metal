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
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_34 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _112 = false;
    bool _110 = false;
    float _46 = in.m_34.x;
    float _48 = in.m_34.y;
    float2 _283 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_283, float2(0.0), isnan(_283))).x;
    float _52 = -_50;
    float _54 = fma(_52, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _56 = 1.0 / _54;
    float _58 = in.m_36.y;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = _56 * _60;
    float _64 = -_62;
    bool _68 = _64 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _70 = -_62;
    bool _72 = _70 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _74 = !_68;
    uint _77 = uint(_74 ? 0 : 1);
    uint _79 = 2u;
    if (!_68)
    {
        _79 = 1u;
    }
    uint _81 = _79;
    uint _83 = _81;
    if (!_72)
    {
        _83 = _77;
    }
    uint _85 = _83;
    uint _87 = min(_85, 2u);
    float _89 = _62 * _58;
    int _92 = int(_87) << 2;
    float _94 = in.m_36.x;
    uint _96 = uint(int(uint(_92) >> uint(2)));
    uint _98 = uint(int(uint(int(_96)) >> uint(2)));
    int _100 = int(_96) & 3;
    float _102 = (*spvDescriptorSet0.fp_c1)._m0[int(_98)][_100];
    float _104 = _62 * _94;
    bool _106 = as_type<int>(_102) == 368;
    if (!_106)
    {
        bool _108 = as_type<int>(_102) == 640;
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
            float _114 = _89 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _116 = _89 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _120 = _89 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _122 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[1].x, _114);
            float _124 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[2].x, _118);
            float _128 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[3].x, _120);
            float _130 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _122);
            float _132 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _126);
            float _136 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _128);
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _146 = _144;
            _148 = _140;
            _150 = _138;
            _152 = _142;
        }
    }
    if ((false || _112) || _110)
    {
        if ((!_112) || _110)
        {
            _110 = false;
            float _154 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _156 = _89 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _89 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _160 = _89 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _162 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[5].x, _154);
            float _164 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[6].x, _158);
            float _168 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[7].x, _160);
            float _170 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _162);
            float _172 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _166);
            float _176 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _168);
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _146 = _184;
            _148 = _180;
            _150 = _178;
            _152 = _182;
        }
        if (false || _112)
        {
            _112 = false;
            float _186 = _89 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _188 = _89 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _89 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _192 = _89 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _194 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[9].x, _186);
            float _196 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[10].x, _190);
            float _200 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[11].x, _192);
            float _202 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _194);
            float _204 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _198);
            float _208 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _200);
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _146 = _216;
            _148 = _212;
            _150 = _210;
            _152 = _214;
        }
    }
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = 1.0 / _218;
    float _228 = float(int(_85));
    float _230 = rint(_228);
    float _232 = precise::max(_230, 0.0);
    uint _234 = uint(_232);
    uint _236 = clamp(_234, 0u, 65535u);
    float _238 = _226 * _220;
    float _240 = _226 * _222;
    float _242 = _226 * _224;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float3 _689 = float3(_238, _240, float(int(_236)));
    float3 _693 = select(_689, float3(0.0), isnan(_689));
    float _246 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _693.xy, uint(rint(_693.z)), _244);
    float _248 = -_62;
    float _250 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _252 = _248 + _250;
    float _254 = -_62;
    float _256 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _258 = _254 + _256;
    float _260 = _252 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _266 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _270 = _246 + _262;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _270;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _268;
    return out;
}

