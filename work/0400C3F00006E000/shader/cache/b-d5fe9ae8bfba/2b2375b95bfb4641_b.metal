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
    bool _126 = false;
    bool _124 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _402 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_402, float2(0.0), isnan(_402))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
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
    uint _104 = min(_102, 2u);
    int _106 = int(_104) << 2;
    float _108 = in.m_40.x;
    uint _110 = uint(int(uint(_106) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.fp_c1)._m0[int(_112)][_114];
    float _118 = _66 * _108;
    bool _120 = as_type<int>(_116) == 416;
    if (!_120)
    {
        bool _122 = as_type<int>(_116) == 688;
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
            _162 = _156;
            _164 = _152;
            _166 = _154;
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
            _162 = _196;
            _164 = _192;
            _166 = _194;
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
            _162 = _228;
            _164 = _224;
            _166 = _226;
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
    float _252 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _254 = _240 * _234;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _240 * _236;
    float _260 = _240 * _238;
    float _262 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _264 = _256 * _252;
    float _266 = _256 * _262;
    float _268 = fma(_264, 0.5, _258);
    float _270 = fma(_264, 1.5, _258);
    float _272 = fma(_266, 1.5, _260);
    float _274 = fma(_264, -0.5, _258);
    float3 _857 = float3(_268, _272, float(int(_250)));
    float3 _861 = select(_857, float3(0.0), isnan(_857));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _861.xy, uint(rint(_861.z)), _256);
    float3 _870 = float3(_270, _272, float(int(_250)));
    float3 _872 = select(_870, float3(0.0), isnan(_870));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _872.xy, uint(rint(_872.z)), _256);
    float _280 = fma(_264, -1.5, _258);
    float3 _885 = float3(_274, _272, float(int(_250)));
    float3 _887 = select(_885, float3(0.0), isnan(_885));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _887.xy, uint(rint(_887.z)), _256);
    float _284 = fma(_266, 0.5, _260);
    float3 _899 = float3(_280, _272, float(int(_250)));
    float3 _901 = select(_899, float3(0.0), isnan(_899));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _901.xy, uint(rint(_901.z)), _256);
    float3 _910 = float3(_270, _284, float(int(_250)));
    float3 _912 = select(_910, float3(0.0), isnan(_910));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _912.xy, uint(rint(_912.z)), _256);
    float3 _921 = float3(_268, _284, float(int(_250)));
    float3 _923 = select(_921, float3(0.0), isnan(_921));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _923.xy, uint(rint(_923.z)), _256);
    float2 _929 = float2(_50, _52);
    float2 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_929, float2(0.0), isnan(_929))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_929, float2(0.0), isnan(_929))).xy;
    float _296 = _294.x;
    float _298 = _294.y;
    float3 _944 = float3(_274, _284, float(int(_250)));
    float3 _946 = select(_944, float3(0.0), isnan(_944));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _946.xy, uint(rint(_946.z)), _256);
    float _302 = fma(_266, -0.5, _260);
    float _304 = _278 + _276;
    float _306 = _304 + _282;
    float _308 = _306 + _286;
    float _310 = _308 + _288;
    float3 _970 = float3(_280, _284, float(int(_250)));
    float3 _972 = select(_970, float3(0.0), isnan(_970));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _972.xy, uint(rint(_972.z)), _256);
    float3 _981 = float3(_270, _302, float(int(_250)));
    float3 _983 = select(_981, float3(0.0), isnan(_981));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _983.xy, uint(rint(_983.z)), _256);
    float3 _992 = float3(_268, _302, float(int(_250)));
    float3 _994 = select(_992, float3(0.0), isnan(_992));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _994.xy, uint(rint(_994.z)), _256);
    float3 _1003 = float3(_274, _302, float(int(_250)));
    float3 _1005 = select(_1003, float3(0.0), isnan(_1003));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1005.xy, uint(rint(_1005.z)), _256);
    float _320 = fma(_266, -1.5, _260);
    float _322 = _310 + _290;
    float _324 = fma(_298, 2.0, -1.0);
    float _326 = fma(_296, 2.0, -1.0);
    float _328 = _324 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _330 = _322 + _300;
    float _332 = _326 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _334 = fma(_328, 2.0, _52);
    float _336 = fma(_332, 2.0, _50);
    float3 _1044 = float3(_280, _302, float(int(_250)));
    float3 _1046 = select(_1044, float3(0.0), isnan(_1044));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1046.xy, uint(rint(_1046.z)), _256);
    float3 _1055 = float3(_270, _320, float(int(_250)));
    float3 _1057 = select(_1055, float3(0.0), isnan(_1055));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1057.xy, uint(rint(_1057.z)), _256);
    float3 _1066 = float3(_268, _320, float(int(_250)));
    float3 _1068 = select(_1066, float3(0.0), isnan(_1066));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1068.xy, uint(rint(_1068.z)), _256);
    float3 _1077 = float3(_274, _320, float(int(_250)));
    float3 _1079 = select(_1077, float3(0.0), isnan(_1077));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1079.xy, uint(rint(_1079.z)), _256);
    float3 _1088 = float3(_280, _320, float(int(_250)));
    float3 _1090 = select(_1088, float3(0.0), isnan(_1088));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1090.xy, uint(rint(_1090.z)), _256);
    float2 _1096 = float2(_336, _334);
    float _348 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1096, float2(0.0), isnan(_1096))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1096, float2(0.0), isnan(_1096))).x;
    float _350 = -_66;
    float _352 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _354 = _350 + _352;
    float _356 = _354 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = _358 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _362 = _330 + _312;
    float _364 = _362 + _314;
    float _366 = _364 + _316;
    float _368 = _366 + _318;
    float _370 = _368 + _338;
    float _372 = _370 + _340;
    float _374 = -_66;
    float _376 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _378 = _374 + _376;
    float _380 = _372 + _342;
    float _382 = _378 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _384 = precise::clamp(_382, 0.0, 1.0);
    float _386 = _380 + _344;
    float _388 = _386 + _346;
    float _390 = fma(_388, 0.0625, _384);
    out.m_43.x = _348;
    out.m_43.y = _390;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _360;
    return out;
}

