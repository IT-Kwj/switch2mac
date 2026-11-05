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
    float2 _367 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_367, float2(0.0), isnan(_367))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_367, float2(0.0), isnan(_367))).x;
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
            _150 = _138;
            _152 = _140;
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
            _150 = _178;
            _152 = _180;
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
            _150 = _210;
            _152 = _212;
        }
    }
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = 1.0 / _218;
    float _228 = float(int(_87));
    float _230 = rint(_228);
    float _232 = precise::max(_230, 0.0);
    uint _234 = uint(_232);
    uint _236 = clamp(_234, 0u, 65535u);
    float _238 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _240 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _242 = _226 * _220;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _226 * _222;
    float _248 = _226 * _224;
    float _250 = _244 * _238;
    float _252 = _244 * _240;
    float _254 = fma(_250, 0.5, _246);
    float _256 = fma(_252, 1.5, _248);
    float _258 = fma(_250, 1.5, _246);
    float _260 = fma(_250, -0.5, _246);
    float3 _806 = float3(_254, _256, float(int(_236)));
    float3 _810 = select(_806, float3(0.0), isnan(_806));
    float _262 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _810.xy, uint(rint(_810.z)), _244);
    float3 _819 = float3(_258, _256, float(int(_236)));
    float3 _821 = select(_819, float3(0.0), isnan(_819));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _821.xy, uint(rint(_821.z)), _244);
    float _266 = fma(_250, -1.5, _246);
    float3 _834 = float3(_260, _256, float(int(_236)));
    float3 _836 = select(_834, float3(0.0), isnan(_834));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _836.xy, uint(rint(_836.z)), _244);
    float _270 = fma(_252, 0.5, _248);
    float3 _848 = float3(_266, _256, float(int(_236)));
    float3 _850 = select(_848, float3(0.0), isnan(_848));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _850.xy, uint(rint(_850.z)), _244);
    float3 _859 = float3(_258, _270, float(int(_236)));
    float3 _861 = select(_859, float3(0.0), isnan(_859));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _861.xy, uint(rint(_861.z)), _244);
    float3 _870 = float3(_254, _270, float(int(_236)));
    float3 _872 = select(_870, float3(0.0), isnan(_870));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _872.xy, uint(rint(_872.z)), _244);
    float _278 = fma(_252, -0.5, _248);
    float3 _884 = float3(_260, _270, float(int(_236)));
    float3 _886 = select(_884, float3(0.0), isnan(_884));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _886.xy, uint(rint(_886.z)), _244);
    float3 _895 = float3(_266, _270, float(int(_236)));
    float3 _897 = select(_895, float3(0.0), isnan(_895));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _897.xy, uint(rint(_897.z)), _244);
    float3 _906 = float3(_258, _278, float(int(_236)));
    float3 _908 = select(_906, float3(0.0), isnan(_906));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _908.xy, uint(rint(_908.z)), _244);
    float3 _917 = float3(_254, _278, float(int(_236)));
    float3 _919 = select(_917, float3(0.0), isnan(_917));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _919.xy, uint(rint(_919.z)), _244);
    float3 _928 = float3(_260, _278, float(int(_236)));
    float3 _930 = select(_928, float3(0.0), isnan(_928));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _930.xy, uint(rint(_930.z)), _244);
    float _290 = fma(_252, -1.5, _248);
    float3 _942 = float3(_266, _278, float(int(_236)));
    float3 _944 = select(_942, float3(0.0), isnan(_942));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _944.xy, uint(rint(_944.z)), _244);
    float3 _953 = float3(_258, _290, float(int(_236)));
    float3 _955 = select(_953, float3(0.0), isnan(_953));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _955.xy, uint(rint(_955.z)), _244);
    float3 _964 = float3(_254, _290, float(int(_236)));
    float3 _966 = select(_964, float3(0.0), isnan(_964));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _966.xy, uint(rint(_966.z)), _244);
    float3 _975 = float3(_260, _290, float(int(_236)));
    float3 _977 = select(_975, float3(0.0), isnan(_975));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _977.xy, uint(rint(_977.z)), _244);
    float3 _986 = float3(_266, _290, float(int(_236)));
    float3 _988 = select(_986, float3(0.0), isnan(_986));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _988.xy, uint(rint(_988.z)), _244);
    float _302 = _264 + _262;
    float _304 = _302 + _268;
    float _306 = -_62;
    float _308 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _310 = _306 + _308;
    float _312 = _304 + _272;
    float _314 = -_62;
    float _316 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _318 = _314 + _316;
    float _320 = _310 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = _312 + _274;
    float _326 = _318 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = _324 + _276;
    float _332 = _328 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _334 = _330 + _280;
    float _336 = _334 + _282;
    float _338 = _336 + _284;
    float _340 = _338 + _286;
    float _342 = _340 + _288;
    float _344 = _342 + _292;
    float _346 = _344 + _294;
    float _348 = _346 + _296;
    float _350 = _348 + _298;
    float _352 = _350 + _300;
    float _354 = fma(_352, 0.0625, _322);
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _354;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _332;
    return out;
}

