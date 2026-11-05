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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
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
    float2 _398 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_398, float2(0.0), isnan(_398))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_398, float2(0.0), isnan(_398))).x;
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
            float _124 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _126 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _128 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _130 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _132 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
            float _134 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[1].x, _126);
            float _136 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
            float _138 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[3].x, _130);
            float _140 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _132);
            float _142 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _134);
            float _144 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _136);
            float _146 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _138);
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
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
            float _164 = _64 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _166 = _64 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _168 = _64 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _170 = _64 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _172 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[4].x, _164);
            float _174 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[5].x, _166);
            float _176 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[6].x, _168);
            float _178 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[7].x, _170);
            float _180 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _172);
            float _182 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _174);
            float _184 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _176);
            float _186 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _178);
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _156 = _194;
            _158 = _192;
            _160 = _188;
            _162 = _190;
        }
        if (false || _122)
        {
            _122 = false;
            float _196 = _64 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _198 = _64 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _200 = _64 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _202 = _64 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _204 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[8].x, _196);
            float _206 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[9].x, _198);
            float _208 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[10].x, _200);
            float _210 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[11].x, _202);
            float _212 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _204);
            float _214 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _206);
            float _216 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _208);
            float _218 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _210);
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
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
    float _236 = 1.0 / _228;
    float _238 = float(int(_98));
    float _240 = rint(_238);
    float _242 = precise::max(_240, 0.0);
    uint _244 = uint(_242);
    uint _246 = clamp(_244, 0u, 65535u);
    float _248 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _250 = _236 * _230;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _236 * _232;
    float _256 = _236 * _234;
    float _258 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _260 = _252 * _248;
    float _262 = _252 * _258;
    float _264 = fma(_260, 0.5, _254);
    float _266 = fma(_260, 1.5, _254);
    float _268 = fma(_262, 1.5, _256);
    float _270 = fma(_260, -0.5, _254);
    float3 _849 = float3(_264, _268, float(int(_246)));
    float3 _853 = select(_849, float3(0.0), isnan(_849));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _853.xy, uint(rint(_853.z)), _252);
    float3 _862 = float3(_266, _268, float(int(_246)));
    float3 _864 = select(_862, float3(0.0), isnan(_862));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _864.xy, uint(rint(_864.z)), _252);
    float _276 = fma(_260, -1.5, _254);
    float3 _877 = float3(_270, _268, float(int(_246)));
    float3 _879 = select(_877, float3(0.0), isnan(_877));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _879.xy, uint(rint(_879.z)), _252);
    float _280 = fma(_262, 0.5, _256);
    float3 _891 = float3(_276, _268, float(int(_246)));
    float3 _893 = select(_891, float3(0.0), isnan(_891));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _893.xy, uint(rint(_893.z)), _252);
    float3 _902 = float3(_266, _280, float(int(_246)));
    float3 _904 = select(_902, float3(0.0), isnan(_902));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _904.xy, uint(rint(_904.z)), _252);
    float3 _913 = float3(_264, _280, float(int(_246)));
    float3 _915 = select(_913, float3(0.0), isnan(_913));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _915.xy, uint(rint(_915.z)), _252);
    float2 _921 = float2(_50, _52);
    float2 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_921, float2(0.0), isnan(_921))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_921, float2(0.0), isnan(_921))).xy;
    float _292 = _290.x;
    float _294 = _290.y;
    float3 _936 = float3(_270, _280, float(int(_246)));
    float3 _938 = select(_936, float3(0.0), isnan(_936));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _938.xy, uint(rint(_938.z)), _252);
    float _298 = fma(_262, -0.5, _256);
    float _300 = _274 + _272;
    float _302 = _300 + _278;
    float _304 = _302 + _282;
    float _306 = _304 + _284;
    float3 _962 = float3(_276, _280, float(int(_246)));
    float3 _964 = select(_962, float3(0.0), isnan(_962));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _964.xy, uint(rint(_964.z)), _252);
    float3 _973 = float3(_266, _298, float(int(_246)));
    float3 _975 = select(_973, float3(0.0), isnan(_973));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _975.xy, uint(rint(_975.z)), _252);
    float3 _984 = float3(_264, _298, float(int(_246)));
    float3 _986 = select(_984, float3(0.0), isnan(_984));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _986.xy, uint(rint(_986.z)), _252);
    float3 _995 = float3(_270, _298, float(int(_246)));
    float3 _997 = select(_995, float3(0.0), isnan(_995));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _997.xy, uint(rint(_997.z)), _252);
    float _316 = fma(_262, -1.5, _256);
    float _318 = _306 + _286;
    float _320 = fma(_294, 2.0, -1.0);
    float _322 = fma(_292, 2.0, -1.0);
    float _324 = _320 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _326 = _318 + _296;
    float _328 = _322 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _330 = fma(_324, 2.0, _52);
    float _332 = fma(_328, 2.0, _50);
    float3 _1036 = float3(_276, _298, float(int(_246)));
    float3 _1038 = select(_1036, float3(0.0), isnan(_1036));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1038.xy, uint(rint(_1038.z)), _252);
    float3 _1047 = float3(_266, _316, float(int(_246)));
    float3 _1049 = select(_1047, float3(0.0), isnan(_1047));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1049.xy, uint(rint(_1049.z)), _252);
    float3 _1058 = float3(_264, _316, float(int(_246)));
    float3 _1060 = select(_1058, float3(0.0), isnan(_1058));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1060.xy, uint(rint(_1060.z)), _252);
    float3 _1069 = float3(_270, _316, float(int(_246)));
    float3 _1071 = select(_1069, float3(0.0), isnan(_1069));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1071.xy, uint(rint(_1071.z)), _252);
    float3 _1080 = float3(_276, _316, float(int(_246)));
    float3 _1082 = select(_1080, float3(0.0), isnan(_1080));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1082.xy, uint(rint(_1082.z)), _252);
    float2 _1088 = float2(_332, _330);
    float _344 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1088, float2(0.0), isnan(_1088))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1088, float2(0.0), isnan(_1088))).x;
    float _346 = -_62;
    float _348 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _350 = _346 + _348;
    float _352 = _350 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = _354 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _358 = _326 + _308;
    float _360 = _358 + _310;
    float _362 = _360 + _312;
    float _364 = _362 + _314;
    float _366 = _364 + _334;
    float _368 = _366 + _336;
    float _370 = -_62;
    float _372 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _374 = _370 + _372;
    float _376 = _368 + _338;
    float _378 = _374 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    float _382 = _376 + _340;
    float _384 = _382 + _342;
    float _386 = fma(_384, 0.0625, _380);
    out.m_43.x = _344;
    out.m_43.y = _386;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _356;
    return out;
}

