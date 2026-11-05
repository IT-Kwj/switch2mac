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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _122 = false;
    bool _120 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _362 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_362, float2(0.0), isnan(_362))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_362, float2(0.0), isnan(_362))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _56;
    float _66 = -_62;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = -_62;
    bool _74 = _72 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _76 = -_62;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _80 = !_70;
    int _83 = _80 ? 0 : 1;
    int _85 = 2;
    if (!_70)
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
    float _104 = in.m_40.x;
    uint _106 = uint(int(uint(_102) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c1)._m0[int(_108)][_110];
    float _114 = _62 * _104;
    bool _116 = as_type<int>(_112) == 384;
    if (!_116)
    {
        bool _118 = as_type<int>(_112) == 656;
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
            float _124 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _132 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[3].x, _130);
            float _140 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _138);
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _156 = _154;
            _158 = _152;
            _160 = _148;
            _162 = _150;
        }
    }
    if ((false || _122) || _120)
    {
        if ((!_122) || _120)
        {
            _120 = false;
            float _164 = _64 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _64 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _64 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _64 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _172 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[7].x, _170);
            float _180 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _178);
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _156 = _194;
            _158 = _192;
            _160 = _188;
            _162 = _190;
        }
        if (false || _122)
        {
            _122 = false;
            float _196 = _64 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _64 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _64 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _64 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _204 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[11].x, _202);
            float _212 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _210);
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _156 = _226;
            _158 = _224;
            _160 = _220;
            _162 = _222;
        }
    }
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float2 _749 = float2(_50, _52);
    float2 _238 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_749, float2(0.0), isnan(_749))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_749, float2(0.0), isnan(_749))).xy;
    float _240 = _238.x;
    float _242 = _238.y;
    float _244 = float(int(_98));
    float _246 = 1.0 / _228;
    float _248 = rint(_244);
    float _250 = precise::max(_248, 0.0);
    uint _252 = uint(_250);
    uint _254 = clamp(_252, 0u, 65535u);
    float _256 = _246 * _230;
    float _258 = _246 * _232;
    float _260 = _246 * _234;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _266 = fma(_262, _264, _256);
    float _268 = fma(_240, 2.0, -1.0);
    float _270 = fma(_242, 2.0, -1.0);
    float _272 = _268 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _274 = _270 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _276 = -_264;
    float _278 = fma(_262, _276, _256);
    float _280 = fma(_272, 2.0, _50);
    float _282 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _284 = fma(_274, 2.0, _52);
    float _286 = fma(_262, _282, _258);
    float _288 = -_282;
    float _290 = fma(_262, _288, _258);
    float3 _845 = float3(_256, _286, float(int(_254)));
    float3 _849 = select(_845, float3(0.0), isnan(_845));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _849.xy, uint(rint(_849.z)), _262);
    float3 _858 = float3(_266, _286, float(int(_254)));
    float3 _860 = select(_858, float3(0.0), isnan(_858));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _860.xy, uint(rint(_860.z)), _262);
    float3 _869 = float3(_278, _286, float(int(_254)));
    float3 _871 = select(_869, float3(0.0), isnan(_869));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _871.xy, uint(rint(_871.z)), _262);
    float3 _880 = float3(_266, _258, float(int(_254)));
    float3 _882 = select(_880, float3(0.0), isnan(_880));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _882.xy, uint(rint(_882.z)), _262);
    float3 _891 = float3(_256, _258, float(int(_254)));
    float3 _893 = select(_891, float3(0.0), isnan(_891));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _893.xy, uint(rint(_893.z)), _262);
    float3 _902 = float3(_278, _258, float(int(_254)));
    float3 _904 = select(_902, float3(0.0), isnan(_902));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _904.xy, uint(rint(_904.z)), _262);
    float3 _913 = float3(_266, _290, float(int(_254)));
    float3 _915 = select(_913, float3(0.0), isnan(_913));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _915.xy, uint(rint(_915.z)), _262);
    float3 _924 = float3(_256, _290, float(int(_254)));
    float3 _926 = select(_924, float3(0.0), isnan(_924));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _926.xy, uint(rint(_926.z)), _262);
    float3 _935 = float3(_278, _290, float(int(_254)));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _937.xy, uint(rint(_937.z)), _262);
    float2 _943 = float2(_280, _284);
    float _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_943, float2(0.0), isnan(_943))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_943, float2(0.0), isnan(_943))).x;
    float _312 = -_62;
    float _314 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _316 = _312 + _314;
    float _318 = -_62;
    float _320 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _322 = _318 + _320;
    float _324 = _316 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _322 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = _330 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _334 = _294 + _292;
    float _336 = _334 + _296;
    float _338 = _336 + _298;
    float _340 = _338 + _300;
    float _342 = _340 + _302;
    float _344 = _342 + _304;
    float _346 = _344 + _306;
    float _348 = _346 + _308;
    float _350 = fma(_348, 0.111111111938953399658203125, _326);
    out.m_43.x = _310;
    out.m_43.y = _350;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _332;
    return out;
}

