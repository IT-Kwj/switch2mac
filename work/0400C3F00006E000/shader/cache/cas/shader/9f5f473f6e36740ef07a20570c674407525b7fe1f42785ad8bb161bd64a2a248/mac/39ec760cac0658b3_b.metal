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
    bool _122 = false;
    bool _120 = false;
    float _46 = in.m_34.x;
    float _48 = in.m_34.y;
    float2 _293 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_293, float2(0.0), isnan(_293))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_293, float2(0.0), isnan(_293))).x;
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
    float _74 = -_62;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _78 = !_68;
    int _81 = _78 ? 0 : 1;
    int _83 = 2;
    if (!_68)
    {
        _83 = 1;
    }
    int _85 = _83;
    int _87 = _85;
    if (!_72)
    {
        _87 = _81;
    }
    int _89 = _87;
    int _91 = _89 + 1;
    float _93 = _62 * _58;
    uint _96 = uint(_91);
    if (!_76)
    {
        _96 = uint(_89);
    }
    uint _98 = _96;
    uint _100 = min(_98, 2u);
    int _102 = int(_100) << 2;
    float _104 = in.m_36.x;
    uint _106 = uint(int(uint(_102) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c1)._m0[int(_108)][_110];
    float _114 = _62 * _104;
    bool _116 = as_type<int>(_112) == 416;
    if (!_116)
    {
        bool _118 = as_type<int>(_112) == 688;
        _120 = _118;
        if (!_120)
        {
            _122 = true;
        }
    }
    float _156;
    float _158;
    float _160;
    float _162;
    if (!_120)
    {
        if (!_122)
        {
            float _124 = _93 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _93 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _128 = _93 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _130 = _93 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _132 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
            float _136 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
            float _138 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[3].x, _130);
            float _140 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _134);
            float _144 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _136);
            float _146 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _138);
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _156 = _154;
            _158 = _150;
            _160 = _148;
            _162 = _152;
        }
    }
    if ((false || _122) || _120)
    {
        if ((!_122) || _120)
        {
            _120 = false;
            float _164 = _93 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _93 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _168 = _93 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _170 = _93 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _172 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[4].x, _166);
            float _176 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[6].x, _168);
            float _178 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[7].x, _170);
            float _180 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _174);
            float _184 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _176);
            float _186 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _178);
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _156 = _194;
            _158 = _190;
            _160 = _188;
            _162 = _192;
        }
        if (false || _122)
        {
            _122 = false;
            float _196 = _93 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _93 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _200 = _93 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _202 = _93 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _204 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[8].x, _198);
            float _208 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[10].x, _200);
            float _210 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[11].x, _202);
            float _212 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _206);
            float _216 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _208);
            float _218 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _210);
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _156 = _226;
            _158 = _222;
            _160 = _220;
            _162 = _224;
        }
    }
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = 1.0 / _228;
    float _238 = float(int(_98));
    float _240 = rint(_238);
    float _242 = precise::max(_240, 0.0);
    uint _244 = uint(_242);
    uint _246 = clamp(_244, 0u, 65535u);
    float _248 = _236 * _230;
    float _250 = _236 * _232;
    float _252 = _236 * _234;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float3 _715 = float3(_248, _250, float(int(_246)));
    float3 _719 = select(_715, float3(0.0), isnan(_715));
    float _256 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _719.xy, uint(rint(_719.z)), _254);
    float _258 = -_62;
    float _260 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _262 = _258 + _260;
    float _264 = -_62;
    float _266 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _268 = _264 + _266;
    float _270 = _262 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _276 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _280 = _256 + _272;
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _280;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _278;
    return out;
}

