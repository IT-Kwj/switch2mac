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
    bool _120 = false;
    bool _118 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _319 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_319, float2(0.0), isnan(_319))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_319, float2(0.0), isnan(_319))).x;
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
    float _78 = -_62;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _82 = !_70;
    int _85 = _82 ? 0 : 1;
    int _87 = 2;
    if (!_70)
    {
        _87 = 1;
    }
    int _89 = _87;
    int _91 = _89;
    if (!_76)
    {
        _91 = _85;
    }
    int _93 = _91;
    int _95 = _93 + 1;
    uint _98 = uint(_95);
    if (!_80)
    {
        _98 = uint(_93);
    }
    uint _100 = _98;
    uint _102 = min(_100, 2u);
    int _104 = int(_102) << 2;
    uint _106 = uint(int(uint(_104) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c1)._m0[int(_108)][_110];
    bool _114 = as_type<int>(_112) == 384;
    if (!_114)
    {
        bool _116 = as_type<int>(_112) == 656;
        _118 = _116;
        if (!_118)
        {
            _120 = true;
        }
    }
    float _154;
    float _156;
    float _158;
    float _160;
    if (!_118)
    {
        if (!_120)
        {
            float _122 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _130 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _128);
            float _138 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _136);
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _154 = _152;
            _156 = _150;
            _158 = _146;
            _160 = _148;
        }
    }
    if ((false || _120) || _118)
    {
        if ((!_120) || _118)
        {
            _118 = false;
            float _162 = _72 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _72 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _72 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _170 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].x, _168);
            float _178 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _176);
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _154 = _192;
            _156 = _190;
            _158 = _186;
            _160 = _188;
        }
        if (false || _120)
        {
            _120 = false;
            float _194 = _72 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _72 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _72 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _72 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _202 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].x, _200);
            float _210 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _208);
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _154 = _224;
            _156 = _222;
            _158 = _218;
            _160 = _220;
        }
    }
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = 1.0 / _226;
    float _236 = float(int(_100));
    float _238 = rint(_236);
    float _240 = precise::max(_238, 0.0);
    uint _242 = uint(_240);
    uint _244 = clamp(_242, 0u, 65535u);
    float _246 = _234 * _228;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _234 * _230;
    float _252 = _234 * _232;
    float _254 = _248 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _258 = _254 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _260 = fma(_256, 0.5, _250);
    float _262 = fma(_256, -0.5, _250);
    float _264 = fma(_258, 0.5, _252);
    float _266 = fma(_258, -0.5, _252);
    float3 _765 = float3(_262, _264, float(int(_244)));
    float3 _769 = select(_765, float3(0.0), isnan(_765));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _769.xy, uint(rint(_769.z)), _248);
    float3 _778 = float3(_260, _264, float(int(_244)));
    float3 _780 = select(_778, float3(0.0), isnan(_778));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _780.xy, uint(rint(_780.z)), _248);
    float3 _789 = float3(_260, _266, float(int(_244)));
    float3 _791 = select(_789, float3(0.0), isnan(_789));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _791.xy, uint(rint(_791.z)), _248);
    float3 _800 = float3(_262, _266, float(int(_244)));
    float3 _802 = select(_800, float3(0.0), isnan(_800));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _802.xy, uint(rint(_802.z)), _248);
    float2 _808 = float2(_48, _50);
    float _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_808, float2(0.0), isnan(_808))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_808, float2(0.0), isnan(_808))).x;
    float _278 = -_62;
    float _280 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _282 = _278 + _280;
    float _284 = -_62;
    float _286 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _288 = _284 + _286;
    float _290 = _288 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = _292 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _296 = _270 + _268;
    float _298 = _296 + _272;
    float _300 = _298 + _274;
    float _302 = _282 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = fma(_300, 0.25, _304);
    out.m_41.x = _276;
    out.m_41.y = _306;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _294;
    return out;
}

