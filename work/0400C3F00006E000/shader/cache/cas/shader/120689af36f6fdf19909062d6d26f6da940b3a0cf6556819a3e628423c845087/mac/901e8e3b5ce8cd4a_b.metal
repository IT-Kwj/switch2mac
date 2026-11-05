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
    bool _126 = false;
    bool _124 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _366 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_366, float2(0.0), isnan(_366))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_366, float2(0.0), isnan(_366))).x;
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
            float _128 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _130 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _132 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _134 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
            float _138 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
            float _140 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].x, _132);
            float _142 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _140);
            float _150 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
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
            float _168 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _170 = _68 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _172 = _68 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _174 = _68 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[5].x, _168);
            float _178 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[6].x, _170);
            float _180 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[4].x, _172);
            float _182 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _180);
            float _190 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _196;
            _164 = _192;
            _166 = _194;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _68 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _202 = _68 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _204 = _68 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _206 = _68 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[9].x, _200);
            float _210 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[10].x, _202);
            float _212 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[8].x, _204);
            float _214 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _212);
            float _222 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
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
    float2 _758 = float2(_50, _52);
    float2 _242 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_758, float2(0.0), isnan(_758))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_758, float2(0.0), isnan(_758))).xy;
    float _244 = _242.x;
    float _246 = _242.y;
    float _248 = float(int(_102));
    float _250 = 1.0 / _232;
    float _252 = rint(_248);
    float _254 = precise::max(_252, 0.0);
    uint _256 = uint(_254);
    uint _258 = clamp(_256, 0u, 65535u);
    float _260 = _250 * _234;
    float _262 = _250 * _236;
    float _264 = _250 * _238;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _270 = fma(_266, _268, _260);
    float _272 = fma(_244, 2.0, -1.0);
    float _274 = fma(_246, 2.0, -1.0);
    float _276 = _272 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _278 = _274 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _280 = -_268;
    float _282 = fma(_266, _280, _260);
    float _284 = fma(_276, 2.0, _50);
    float _286 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _288 = fma(_278, 2.0, _52);
    float _290 = fma(_266, _286, _262);
    float _292 = -_286;
    float _294 = fma(_266, _292, _262);
    float3 _853 = float3(_260, _290, float(int(_258)));
    float3 _857 = select(_853, float3(0.0), isnan(_853));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _857.xy, uint(rint(_857.z)), _266);
    float3 _866 = float3(_270, _290, float(int(_258)));
    float3 _868 = select(_866, float3(0.0), isnan(_866));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _868.xy, uint(rint(_868.z)), _266);
    float3 _877 = float3(_282, _290, float(int(_258)));
    float3 _879 = select(_877, float3(0.0), isnan(_877));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _879.xy, uint(rint(_879.z)), _266);
    float3 _888 = float3(_270, _262, float(int(_258)));
    float3 _890 = select(_888, float3(0.0), isnan(_888));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _890.xy, uint(rint(_890.z)), _266);
    float3 _899 = float3(_260, _262, float(int(_258)));
    float3 _901 = select(_899, float3(0.0), isnan(_899));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _901.xy, uint(rint(_901.z)), _266);
    float3 _910 = float3(_282, _262, float(int(_258)));
    float3 _912 = select(_910, float3(0.0), isnan(_910));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _912.xy, uint(rint(_912.z)), _266);
    float3 _921 = float3(_270, _294, float(int(_258)));
    float3 _923 = select(_921, float3(0.0), isnan(_921));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _923.xy, uint(rint(_923.z)), _266);
    float3 _932 = float3(_260, _294, float(int(_258)));
    float3 _934 = select(_932, float3(0.0), isnan(_932));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _934.xy, uint(rint(_934.z)), _266);
    float3 _943 = float3(_282, _294, float(int(_258)));
    float3 _945 = select(_943, float3(0.0), isnan(_943));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _945.xy, uint(rint(_945.z)), _266);
    float2 _951 = float2(_284, _288);
    float _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_951, float2(0.0), isnan(_951))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_951, float2(0.0), isnan(_951))).x;
    float _316 = -_66;
    float _318 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _320 = _316 + _318;
    float _322 = -_66;
    float _324 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _326 = _322 + _324;
    float _328 = _320 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = _326 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _334 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _338 = _298 + _296;
    float _340 = _338 + _300;
    float _342 = _340 + _302;
    float _344 = _342 + _304;
    float _346 = _344 + _306;
    float _348 = _346 + _308;
    float _350 = _348 + _310;
    float _352 = _350 + _312;
    float _354 = fma(_352, 0.111111111938953399658203125, _330);
    out.m_43.x = _314;
    out.m_43.y = _354;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _336;
    return out;
}

