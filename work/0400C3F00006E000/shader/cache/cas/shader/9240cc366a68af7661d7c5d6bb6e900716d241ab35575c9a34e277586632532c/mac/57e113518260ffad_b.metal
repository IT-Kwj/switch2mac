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
    bool _108 = false;
    bool _106 = false;
    float _46 = in.m_34.x;
    float _48 = in.m_34.y;
    float2 _305 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_305, float2(0.0), isnan(_305))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_305, float2(0.0), isnan(_305))).x;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float _56 = -_50;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _52;
    float _64 = -_60;
    bool _68 = _64 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _70 = _60 * _54;
    float _72 = -_60;
    bool _74 = _72 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _76 = !_68;
    uint _79 = uint(_76 ? 0 : 1);
    uint _81 = 2u;
    if (!_68)
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
    uint _94 = uint(int(uint(_92) >> uint(2)));
    uint _96 = uint(int(uint(int(_94)) >> uint(2)));
    int _98 = int(_94) & 3;
    float _100 = (*spvDescriptorSet0.fp_c1)._m0[int(_96)][_98];
    bool _102 = as_type<int>(_100) == 336;
    if (!_102)
    {
        bool _104 = as_type<int>(_100) == 608;
        _106 = _104;
        if (!_106)
        {
            _108 = true;
        }
    }
    float _142;
    float _144;
    float _146;
    float _148;
    if (!_106)
    {
        if (!_108)
        {
            float _110 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _112 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _114 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _116 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _118 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].x, _110);
            float _120 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].x, _112);
            float _122 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].x, _114);
            float _124 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].x, _116);
            float _126 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _118);
            float _128 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _120);
            float _130 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _122);
            float _132 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _124);
            float _134 = _126 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _136 = _128 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _142 = _140;
            _144 = _138;
            _146 = _134;
            _148 = _136;
        }
    }
    if ((false || _108) || _106)
    {
        if ((!_108) || _106)
        {
            _106 = false;
            float _150 = _70 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _152 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _154 = _70 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _156 = _70 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _158 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].x, _150);
            float _160 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].x, _152);
            float _162 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].x, _154);
            float _164 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].x, _156);
            float _166 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[4].z, _158);
            float _168 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[5].z, _160);
            float _170 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[6].z, _162);
            float _172 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[7].z, _164);
            float _174 = _166 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _176 = _168 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _142 = _180;
            _144 = _178;
            _146 = _174;
            _148 = _176;
        }
        if (false || _108)
        {
            _108 = false;
            float _182 = _70 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _184 = _70 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _186 = _70 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _188 = _70 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _190 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].x, _182);
            float _192 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].x, _184);
            float _194 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].x, _186);
            float _196 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].x, _188);
            float _198 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[8].z, _190);
            float _200 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[9].z, _192);
            float _202 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].z, _194);
            float _204 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[11].z, _196);
            float _206 = _198 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _208 = _200 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _142 = _212;
            _144 = _210;
            _146 = _206;
            _148 = _208;
        }
    }
    float _214 = _142;
    float _216 = _144;
    float _218 = _146;
    float _220 = _148;
    float _222 = 1.0 / _214;
    float _224 = float(int(_87));
    float _226 = rint(_224);
    float _228 = precise::max(_226, 0.0);
    uint _230 = uint(_228);
    uint _232 = clamp(_230, 0u, 65535u);
    float _234 = _222 * _216;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = _222 * _218;
    float _240 = _222 * _220;
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _244 = _242 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _246 = _242 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _248 = fma(_244, -0.5, _238);
    float _250 = fma(_246, 0.5, _240);
    float _252 = fma(_244, 0.5, _238);
    float _254 = fma(_246, -0.5, _240);
    float3 _735 = float3(_248, _250, float(int(_232)));
    float3 _739 = select(_735, float3(0.0), isnan(_735));
    float _256 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _739.xy, uint(rint(_739.z)), _236);
    float3 _748 = float3(_252, _250, float(int(_232)));
    float3 _750 = select(_748, float3(0.0), isnan(_748));
    float _258 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _750.xy, uint(rint(_750.z)), _236);
    float3 _759 = float3(_252, _254, float(int(_232)));
    float3 _761 = select(_759, float3(0.0), isnan(_759));
    float _260 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _761.xy, uint(rint(_761.z)), _236);
    float3 _770 = float3(_248, _254, float(int(_232)));
    float3 _772 = select(_770, float3(0.0), isnan(_770));
    float _262 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _772.xy, uint(rint(_772.z)), _236);
    float _264 = -_60;
    float _266 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _268 = _264 + _266;
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = _272 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _276 = _258 + _256;
    float _278 = -_60;
    float _280 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _282 = _278 + _280;
    float _284 = _282 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = _276 + _260;
    float _290 = _288 + _262;
    float _292 = fma(_290, 0.25, _286);
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _292;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _274;
    return out;
}

