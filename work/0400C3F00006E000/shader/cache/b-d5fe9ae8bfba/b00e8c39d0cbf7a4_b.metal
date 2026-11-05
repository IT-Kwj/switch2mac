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
    bool _118 = false;
    bool _116 = false;
    float _46 = in.m_34.x;
    float _48 = in.m_34.y;
    float2 _289 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_289, float2(0.0), isnan(_289))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_289, float2(0.0), isnan(_289))).x;
    float _52 = -_50;
    float _54 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _56 = fma(_52, (*spvDescriptorSet0.fp_c3)._m0[46].z, _54);
    float _58 = -_56;
    bool _62 = _58 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _64 = -_56;
    bool _66 = _64 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _68 = -_56;
    bool _70 = _68 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _72 = !_62;
    int _75 = _72 ? 0 : 1;
    int _77 = 2;
    if (!_62)
    {
        _77 = 1;
    }
    int _79 = _77;
    int _81 = _79;
    if (!_66)
    {
        _81 = _75;
    }
    int _83 = _81;
    int _85 = _83 + 1;
    uint _88 = uint(_85);
    if (!_70)
    {
        _88 = uint(_83);
    }
    uint _90 = _88;
    float _92 = in.m_36.y;
    uint _94 = min(_90, 2u);
    int _96 = int(_94) << 2;
    float _98 = in.m_36.x;
    uint _100 = uint(int(uint(_96) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    float _108 = _56 * _92;
    float _110 = _56 * _98;
    bool _112 = as_type<int>(_106) == 384;
    if (!_112)
    {
        bool _114 = as_type<int>(_106) == 656;
        _116 = _114;
        if (!_116)
        {
            _118 = true;
        }
    }
    float _152;
    float _154;
    float _156;
    float _158;
    if (!_116)
    {
        if (!_118)
        {
            float _120 = _108 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _108 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _126 = _108 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _128 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
            float _134 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[3].x, _126);
            float _136 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
            float _142 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[3].z, _134);
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _152 = _150;
            _154 = _146;
            _156 = _144;
            _158 = _148;
        }
    }
    if ((false || _118) || _116)
    {
        if ((!_118) || _116)
        {
            _116 = false;
            float _160 = _108 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _108 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _108 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _166 = _108 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _168 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[6].x, _164);
            float _174 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[7].x, _166);
            float _176 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[6].z, _172);
            float _182 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[7].z, _174);
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _152 = _190;
            _154 = _186;
            _156 = _184;
            _158 = _188;
        }
        if (false || _118)
        {
            _118 = false;
            float _192 = _108 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _108 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _108 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _198 = _108 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _200 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[10].x, _196);
            float _206 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[11].x, _198);
            float _208 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[10].z, _204);
            float _214 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[11].z, _206);
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _152 = _222;
            _154 = _218;
            _156 = _216;
            _158 = _220;
        }
    }
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = 1.0 / _224;
    float _234 = float(int(_90));
    float _236 = rint(_234);
    float _238 = precise::max(_236, 0.0);
    uint _240 = uint(_238);
    uint _242 = clamp(_240, 0u, 65535u);
    float _244 = _232 * _226;
    float _246 = _232 * _228;
    float _248 = _232 * _230;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float3 _707 = float3(_244, _246, float(int(_242)));
    float3 _711 = select(_707, float3(0.0), isnan(_707));
    float _252 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _711.xy, uint(rint(_711.z)), _250);
    float _254 = -_56;
    float _256 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _258 = _254 + _256;
    float _260 = -_56;
    float _262 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _264 = _260 + _262;
    float _266 = _258 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _272 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _276 = _252 + _268;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _276;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _274;
    return out;
}

