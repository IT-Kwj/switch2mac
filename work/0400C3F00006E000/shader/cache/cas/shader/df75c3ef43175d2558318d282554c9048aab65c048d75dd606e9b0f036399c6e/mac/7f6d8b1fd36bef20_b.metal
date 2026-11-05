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
    float2 _373 = float2(_46, _48);
    float _50 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_373, float2(0.0), isnan(_373))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_373, float2(0.0), isnan(_373))).x;
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
    float _76 = -_60;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _80 = !_68;
    int _83 = _80 ? 0 : 1;
    int _85 = 2;
    if (!_68)
    {
        _85 = 1;
    }
    int _87 = _85;
    int _89 = _87;
    if (!_74)
    {
        _89 = _83;
    }
    int _91 = _89;
    int _93 = _91 + 1;
    uint _96 = uint(_93);
    if (!_78)
    {
        _96 = uint(_91);
    }
    uint _98 = _96;
    uint _100 = min(_98, 2u);
    int _102 = int(_100) << 2;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.fp_c1)._m0[int(_106)][_108];
    bool _112 = as_type<int>(_110) == 384;
    if (!_112)
    {
        bool _114 = as_type<int>(_110) == 656;
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
            float _120 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _122 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _124 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _126 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _128 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].x, _120);
            float _130 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].x, _122);
            float _132 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
            float _134 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].x, _126);
            float _136 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _128);
            float _138 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _130);
            float _140 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
            float _142 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _134);
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _152 = _150;
            _154 = _148;
            _156 = _144;
            _158 = _146;
        }
    }
    if ((false || _118) || _116)
    {
        if ((!_118) || _116)
        {
            _116 = false;
            float _160 = _70 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _162 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _164 = _70 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _166 = _70 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _168 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].x, _160);
            float _170 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].x, _162);
            float _172 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].x, _164);
            float _174 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].x, _166);
            float _176 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[4].z, _168);
            float _178 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[5].z, _170);
            float _180 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[6].z, _172);
            float _182 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[7].z, _174);
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _152 = _190;
            _154 = _188;
            _156 = _184;
            _158 = _186;
        }
        if (false || _118)
        {
            _118 = false;
            float _192 = _70 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _194 = _70 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _196 = _70 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _198 = _70 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _200 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].x, _192);
            float _202 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].x, _194);
            float _204 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].x, _196);
            float _206 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].x, _198);
            float _208 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[8].z, _200);
            float _210 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[9].z, _202);
            float _212 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].z, _204);
            float _214 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[11].z, _206);
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _152 = _222;
            _154 = _220;
            _156 = _216;
            _158 = _218;
        }
    }
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = 1.0 / _224;
    float _234 = float(int(_98));
    float _236 = rint(_234);
    float _238 = precise::max(_236, 0.0);
    uint _240 = uint(_238);
    uint _242 = clamp(_240, 0u, 65535u);
    float _244 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _246 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _248 = _232 * _226;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = _232 * _228;
    float _254 = _232 * _230;
    float _256 = _250 * _244;
    float _258 = _250 * _246;
    float _260 = fma(_256, 0.5, _252);
    float _262 = fma(_258, 1.5, _254);
    float _264 = fma(_256, 1.5, _252);
    float _266 = fma(_256, -0.5, _252);
    float3 _824 = float3(_260, _262, float(int(_242)));
    float3 _828 = select(_824, float3(0.0), isnan(_824));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _828.xy, uint(rint(_828.z)), _250);
    float3 _837 = float3(_264, _262, float(int(_242)));
    float3 _839 = select(_837, float3(0.0), isnan(_837));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _839.xy, uint(rint(_839.z)), _250);
    float _272 = fma(_256, -1.5, _252);
    float3 _852 = float3(_266, _262, float(int(_242)));
    float3 _854 = select(_852, float3(0.0), isnan(_852));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _854.xy, uint(rint(_854.z)), _250);
    float _276 = fma(_258, 0.5, _254);
    float3 _866 = float3(_272, _262, float(int(_242)));
    float3 _868 = select(_866, float3(0.0), isnan(_866));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _868.xy, uint(rint(_868.z)), _250);
    float3 _877 = float3(_264, _276, float(int(_242)));
    float3 _879 = select(_877, float3(0.0), isnan(_877));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _879.xy, uint(rint(_879.z)), _250);
    float3 _888 = float3(_260, _276, float(int(_242)));
    float3 _890 = select(_888, float3(0.0), isnan(_888));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _890.xy, uint(rint(_890.z)), _250);
    float _284 = fma(_258, -0.5, _254);
    float3 _902 = float3(_266, _276, float(int(_242)));
    float3 _904 = select(_902, float3(0.0), isnan(_902));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _904.xy, uint(rint(_904.z)), _250);
    float3 _913 = float3(_272, _276, float(int(_242)));
    float3 _915 = select(_913, float3(0.0), isnan(_913));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _915.xy, uint(rint(_915.z)), _250);
    float3 _924 = float3(_264, _284, float(int(_242)));
    float3 _926 = select(_924, float3(0.0), isnan(_924));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _926.xy, uint(rint(_926.z)), _250);
    float3 _935 = float3(_260, _284, float(int(_242)));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _937.xy, uint(rint(_937.z)), _250);
    float3 _946 = float3(_266, _284, float(int(_242)));
    float3 _948 = select(_946, float3(0.0), isnan(_946));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _948.xy, uint(rint(_948.z)), _250);
    float _296 = fma(_258, -1.5, _254);
    float3 _960 = float3(_272, _284, float(int(_242)));
    float3 _962 = select(_960, float3(0.0), isnan(_960));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _962.xy, uint(rint(_962.z)), _250);
    float3 _971 = float3(_264, _296, float(int(_242)));
    float3 _973 = select(_971, float3(0.0), isnan(_971));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _973.xy, uint(rint(_973.z)), _250);
    float3 _982 = float3(_260, _296, float(int(_242)));
    float3 _984 = select(_982, float3(0.0), isnan(_982));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _984.xy, uint(rint(_984.z)), _250);
    float3 _993 = float3(_266, _296, float(int(_242)));
    float3 _995 = select(_993, float3(0.0), isnan(_993));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _995.xy, uint(rint(_995.z)), _250);
    float3 _1004 = float3(_272, _296, float(int(_242)));
    float3 _1006 = select(_1004, float3(0.0), isnan(_1004));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1006.xy, uint(rint(_1006.z)), _250);
    float _308 = _270 + _268;
    float _310 = _308 + _274;
    float _312 = -_60;
    float _314 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _316 = _312 + _314;
    float _318 = _310 + _278;
    float _320 = -_60;
    float _322 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _324 = _320 + _322;
    float _326 = _316 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = _318 + _280;
    float _332 = _324 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _330 + _282;
    float _338 = _334 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _340 = _336 + _286;
    float _342 = _340 + _288;
    float _344 = _342 + _290;
    float _346 = _344 + _292;
    float _348 = _346 + _294;
    float _350 = _348 + _298;
    float _352 = _350 + _300;
    float _354 = _352 + _302;
    float _356 = _354 + _304;
    float _358 = _356 + _306;
    float _360 = fma(_358, 0.0625, _328);
    out.m_39.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_39.y = _360;
    out.m_39.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_39.w = _338;
    return out;
}

