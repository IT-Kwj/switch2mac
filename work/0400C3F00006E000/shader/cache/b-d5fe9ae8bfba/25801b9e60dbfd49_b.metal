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
    float2 _331 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_331, float2(0.0), isnan(_331))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_331, float2(0.0), isnan(_331))).x;
    float _52 = in.m_36.y;
    float _54 = -_50;
    float _56 = fma(_54, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _58 = 1.0 / _56;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = _58 * _60;
    float _64 = _62 * _52;
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
    float _89 = in.m_36.x;
    uint _91 = min(_87, 2u);
    int _94 = int(_91) << 2;
    uint _96 = uint(int(uint(_94) >> uint(2)));
    uint _98 = uint(int(uint(int(_96)) >> uint(2)));
    int _100 = int(_96) & 3;
    float _102 = (*spvDescriptorSet0.fp_c1)._m0[int(_98)][_100];
    float _104 = _62 * _89;
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
            float _114 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _116 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _118 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _120 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _122 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[0].x, _114);
            float _124 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[1].x, _116);
            float _126 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[2].x, _118);
            float _128 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[3].x, _120);
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
            _150 = _140;
            _152 = _138;
        }
    }
    if ((false || _112) || _110)
    {
        if ((!_112) || _110)
        {
            _110 = false;
            float _154 = _64 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _156 = _64 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _158 = _64 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _160 = _64 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _162 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[4].x, _154);
            float _164 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[5].x, _156);
            float _166 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[6].x, _158);
            float _168 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[7].x, _160);
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
            _150 = _180;
            _152 = _178;
        }
        if (false || _112)
        {
            _112 = false;
            float _186 = _64 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _188 = _64 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _190 = _64 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _192 = _64 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _194 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[8].x, _186);
            float _196 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[9].x, _188);
            float _198 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[10].x, _190);
            float _200 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[11].x, _192);
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
            _150 = _212;
            _152 = _210;
        }
    }
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = float(int(_87));
    float _228 = 1.0 / _218;
    float _230 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _232 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _234 = rint(_226);
    float _236 = precise::max(_234, 0.0);
    uint _238 = uint(_236);
    uint _240 = clamp(_238, 0u, 65535u);
    float _242 = _228 * _220;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _228 * _222;
    float _248 = _228 * _224;
    float _250 = fma(_244, _232, _246);
    float _252 = fma(_244, _230, _248);
    float _254 = -_232;
    float _256 = fma(_244, _254, _246);
    float _258 = -_230;
    float _260 = fma(_244, _258, _248);
    float3 _769 = float3(_248, _250, float(int(_240)));
    float3 _773 = select(_769, float3(0.0), isnan(_769));
    float _262 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _773.xy, uint(rint(_773.z)), _244);
    float3 _782 = float3(_252, _250, float(int(_240)));
    float3 _784 = select(_782, float3(0.0), isnan(_782));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _784.xy, uint(rint(_784.z)), _244);
    float3 _793 = float3(_260, _250, float(int(_240)));
    float3 _795 = select(_793, float3(0.0), isnan(_793));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _795.xy, uint(rint(_795.z)), _244);
    float3 _804 = float3(_252, _246, float(int(_240)));
    float3 _806 = select(_804, float3(0.0), isnan(_804));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _806.xy, uint(rint(_806.z)), _244);
    float3 _815 = float3(_248, _246, float(int(_240)));
    float3 _817 = select(_815, float3(0.0), isnan(_815));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _817.xy, uint(rint(_817.z)), _244);
    float3 _826 = float3(_260, _246, float(int(_240)));
    float3 _828 = select(_826, float3(0.0), isnan(_826));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _828.xy, uint(rint(_828.z)), _244);
    float3 _837 = float3(_252, _256, float(int(_240)));
    float3 _839 = select(_837, float3(0.0), isnan(_837));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _839.xy, uint(rint(_839.z)), _244);
    float3 _848 = float3(_248, _256, float(int(_240)));
    float3 _850 = select(_848, float3(0.0), isnan(_848));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _850.xy, uint(rint(_850.z)), _244);
    float3 _859 = float3(_260, _256, float(int(_240)));
    float3 _861 = select(_859, float3(0.0), isnan(_859));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _861.xy, uint(rint(_861.z)), _244);
    float _280 = -_62;
    float _282 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _284 = _280 + _282;
    float _286 = -_62;
    float _288 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _290 = _286 + _288;
    float _292 = _284 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _294 = precise::clamp(_292, 0.0, 1.0);
    float _296 = _290 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = _298 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _302 = _264 + _262;
    float _304 = _302 + _266;
    float _306 = _304 + _268;
    float _308 = _306 + _270;
    float _310 = _308 + _272;
    float _312 = _310 + _274;
    float _314 = _312 + _276;
    float _316 = _314 + _278;
    float _318 = fma(_316, 0.111111111938953399658203125, _294);
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _318;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _300;
    return out;
}

