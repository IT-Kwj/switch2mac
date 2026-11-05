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
    float2 _377 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _54;
    float _64 = -_60;
    bool _68 = _64 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _70 = -_60;
    bool _72 = _70 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _74 = -_60;
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
    uint _94 = uint(_91);
    if (!_76)
    {
        _94 = uint(_89);
    }
    uint _96 = _94;
    uint _98 = min(_96, 2u);
    int _100 = int(_98) << 2;
    float _102 = in.m_38.x;
    uint _104 = uint(int(uint(_100) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.fp_c1)._m0[int(_106)][_108];
    float _112 = _60 * _102;
    bool _114 = as_type<int>(_110) == 384;
    if (!_114)
    {
        bool _116 = as_type<int>(_110) == 656;
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
            float _122 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _130 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[3].x, _128);
            float _138 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _136);
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
            float _162 = _62 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _62 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _62 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _62 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _170 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[7].x, _168);
            float _178 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[7].z, _176);
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
            float _194 = _62 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _62 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _62 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _62 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _202 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[11].x, _200);
            float _210 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[11].z, _208);
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
    float _236 = float(int(_96));
    float _238 = rint(_236);
    float _240 = precise::max(_238, 0.0);
    uint _242 = uint(_240);
    uint _244 = clamp(_242, 0u, 65535u);
    float _246 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _248 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _250 = _234 * _228;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _234 * _230;
    float _256 = _234 * _232;
    float _258 = _252 * _246;
    float _260 = _252 * _248;
    float _262 = fma(_258, 0.5, _254);
    float _264 = fma(_258, 1.5, _254);
    float _266 = fma(_258, -0.5, _254);
    float _268 = fma(_258, -1.5, _254);
    float _270 = fma(_260, 1.5, _256);
    float _272 = fma(_260, 0.5, _256);
    float3 _835 = float3(_262, _270, float(int(_244)));
    float3 _839 = select(_835, float3(0.0), isnan(_835));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _839.xy, uint(rint(_839.z)), _252);
    float3 _848 = float3(_264, _270, float(int(_244)));
    float3 _850 = select(_848, float3(0.0), isnan(_848));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _850.xy, uint(rint(_850.z)), _252);
    float3 _859 = float3(_266, _270, float(int(_244)));
    float3 _861 = select(_859, float3(0.0), isnan(_859));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _861.xy, uint(rint(_861.z)), _252);
    float3 _870 = float3(_268, _270, float(int(_244)));
    float3 _872 = select(_870, float3(0.0), isnan(_870));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _872.xy, uint(rint(_872.z)), _252);
    float3 _881 = float3(_262, _272, float(int(_244)));
    float3 _883 = select(_881, float3(0.0), isnan(_881));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _883.xy, uint(rint(_883.z)), _252);
    float3 _892 = float3(_266, _272, float(int(_244)));
    float3 _894 = select(_892, float3(0.0), isnan(_892));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _894.xy, uint(rint(_894.z)), _252);
    float3 _903 = float3(_264, _272, float(int(_244)));
    float3 _905 = select(_903, float3(0.0), isnan(_903));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _905.xy, uint(rint(_905.z)), _252);
    float3 _914 = float3(_268, _272, float(int(_244)));
    float3 _916 = select(_914, float3(0.0), isnan(_914));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _916.xy, uint(rint(_916.z)), _252);
    float _290 = fma(_260, -0.5, _256);
    float3 _928 = float3(_264, _290, float(int(_244)));
    float3 _930 = select(_928, float3(0.0), isnan(_928));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _930.xy, uint(rint(_930.z)), _252);
    float3 _939 = float3(_262, _290, float(int(_244)));
    float3 _941 = select(_939, float3(0.0), isnan(_939));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _941.xy, uint(rint(_941.z)), _252);
    float3 _950 = float3(_266, _290, float(int(_244)));
    float3 _952 = select(_950, float3(0.0), isnan(_950));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _952.xy, uint(rint(_952.z)), _252);
    float3 _961 = float3(_268, _290, float(int(_244)));
    float3 _963 = select(_961, float3(0.0), isnan(_961));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _963.xy, uint(rint(_963.z)), _252);
    float _300 = fma(_260, -1.5, _256);
    float3 _975 = float3(_264, _300, float(int(_244)));
    float3 _977 = select(_975, float3(0.0), isnan(_975));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _977.xy, uint(rint(_977.z)), _252);
    float3 _986 = float3(_262, _300, float(int(_244)));
    float3 _988 = select(_986, float3(0.0), isnan(_986));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _988.xy, uint(rint(_988.z)), _252);
    float3 _997 = float3(_266, _300, float(int(_244)));
    float3 _999 = select(_997, float3(0.0), isnan(_997));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _999.xy, uint(rint(_999.z)), _252);
    float3 _1008 = float3(_268, _300, float(int(_244)));
    float3 _1010 = select(_1008, float3(0.0), isnan(_1008));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1010.xy, uint(rint(_1010.z)), _252);
    float2 _1016 = float2(_48, _50);
    float _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1016, float2(0.0), isnan(_1016))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1016, float2(0.0), isnan(_1016))).x;
    float _312 = -_60;
    float _314 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _316 = _312 + _314;
    float _318 = -_60;
    float _320 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _322 = _318 + _320;
    float _324 = _316 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _322 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = _330 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _334 = _276 + _274;
    float _336 = _334 + _278;
    float _338 = _336 + _280;
    float _340 = _338 + _286;
    float _342 = _340 + _282;
    float _344 = _342 + _284;
    float _346 = _344 + _288;
    float _348 = _346 + _292;
    float _350 = _348 + _294;
    float _352 = _350 + _296;
    float _354 = _352 + _298;
    float _356 = _354 + _302;
    float _358 = _356 + _304;
    float _360 = _358 + _306;
    float _362 = _360 + _308;
    float _364 = fma(_362, 0.0625, _326);
    out.m_41.x = _310;
    out.m_41.y = _364;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _332;
    return out;
}

