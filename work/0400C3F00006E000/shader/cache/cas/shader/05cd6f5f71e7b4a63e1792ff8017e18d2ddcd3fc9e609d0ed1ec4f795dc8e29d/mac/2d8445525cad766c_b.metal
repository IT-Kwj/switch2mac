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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
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
    bool _126 = false;
    bool _124 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _297 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_297, float2(0.0), isnan(_297))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_297, float2(0.0), isnan(_297))).x;
    float2 _308 = float2(_48, _50);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_308, float2(0.0), isnan(_308))).x;
    float _56 = in.m_38.y;
    float _58 = -_52;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _56;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_66;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _80 = -_66;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _84 = !_74;
    int _87 = _84 ? 0 : 1;
    int _89 = 2;
    if (!_74)
    {
        _89 = 1;
    }
    int _91 = _89;
    int _93 = _91;
    if (!_78)
    {
        _93 = _87;
    }
    int _95 = _93;
    int _97 = _95 + 1;
    uint _100 = uint(_97);
    if (!_82)
    {
        _100 = uint(_95);
    }
    uint _102 = _100;
    float _104 = in.m_38.x;
    uint _106 = min(_102, 2u);
    int _108 = int(_106) << 2;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.fp_c1)._m0[int(_112)][_114];
    float _118 = _66 * _104;
    bool _120 = as_type<int>(_116) == 448;
    if (!_120)
    {
        bool _122 = as_type<int>(_116) == 720;
        _124 = _122;
        if (!_124)
        {
            _126 = true;
        }
    }
    float _160;
    float _162;
    float _164;
    float _166;
    if (!_124)
    {
        if (!_126)
        {
            float _128 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _160 = _158;
            _162 = _152;
            _164 = _154;
            _166 = _156;
        }
    }
    if ((false || _126) || _124)
    {
        if ((!_126) || _124)
        {
            _124 = false;
            float _168 = _68 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _68 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _68 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _192;
            _164 = _194;
            _166 = _196;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _68 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _68 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _68 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _68 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _160 = _230;
            _162 = _224;
            _164 = _226;
            _166 = _228;
        }
    }
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = 1.0 / _232;
    float _242 = float(int(_102));
    float _244 = rint(_242);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    uint _250 = clamp(_248, 0u, 65535u);
    float _252 = _240 * _234;
    float _254 = _240 * _236;
    float _256 = _240 * _238;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float3 _727 = float3(_252, _254, float(int(_250)));
    float3 _731 = select(_727, float3(0.0), isnan(_727));
    float _260 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _731.xy, uint(rint(_731.z)), _258);
    float _262 = -_66;
    float _264 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _266 = _262 + _264;
    float _268 = -_66;
    float _270 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _272 = _268 + _270;
    float _274 = _266 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _272 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _280 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _284 = _260 + _276;
    out.m_41.x = _54;
    out.m_41.y = _284;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _282;
    return out;
}

