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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[8].z, -0.5);
    float _65 = _59 * _57;
    float _67 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[8].w, -0.5);
    float _69 = floor(_63);
    float _71 = floor(_67);
    float _73 = _69 + 0.5;
    float _75 = _73 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _77 = _71 + 0.5;
    float _79 = _77 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float2 _338 = float2(_75, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_338, float2(0.0), isnan(_338)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_33.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _59 * _96;
    float _100 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _102 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _104 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _106 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _110 = _100 + _108;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _114 = _102 + _112;
    float _116 = -_100;
    float _118 = _116 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _120 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _122 = _104 + _120;
    float _124 = -_102;
    float _126 = _124 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _128 = precise::max(0.0, _110);
    float _130 = -_104;
    float _132 = _130 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _134 = precise::max(0.0, _114);
    float _136 = precise::max(0.0, _122);
    float _138 = precise::max(_128, _118);
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _142 = _106 + _140;
    float _144 = precise::max(_134, _126);
    float _146 = -_106;
    float _148 = _146 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _150 = precise::max(_136, _132);
    float _152 = precise::max(_138, _98);
    float _154 = precise::max(_144, _98);
    float _156 = precise::max(0.0, _142);
    float _158 = precise::max(_150, _98);
    float _160 = _152 + _154;
    float _162 = precise::max(_156, _148);
    float _164 = _158 + _160;
    float _166 = precise::max(_162, _98);
    float _168 = -_166;
    bool _172 = _164 != _168;
    bool _174 = isnan(_164);
    bool _176 = _172 || _174;
    bool _178 = isnan(_168);
    bool _180 = _176 || _178;
    if (!_180)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        out.m_38.x = 0.0;
        return out;
    }
    float _182 = _79 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _184 = _75 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _511 = float2(_184, _182);
    float4 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_511, float2(0.0), isnan(_511))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_511, float2(0.0), isnan(_511))).xyzw;
    float _188 = _186.x;
    float _190 = _186.y;
    float _192 = _186.z;
    float _194 = _186.w;
    float2 _527 = float2(_75, _182);
    float4 _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).xyzw;
    float _198 = _196.x;
    float _200 = _196.y;
    float _202 = _196.z;
    float _204 = _196.w;
    float2 _543 = float2(_184, _79);
    float4 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_543, float2(0.0), isnan(_543))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_543, float2(0.0), isnan(_543))).xyzw;
    float _208 = _206.x;
    float _210 = _206.y;
    float _212 = _206.z;
    float _214 = _206.w;
    float2 _559 = float2(_75, _79);
    float4 _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_559, float2(0.0), isnan(_559))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_559, float2(0.0), isnan(_559))).xyzw;
    float _218 = _216.x;
    float _220 = _216.y;
    float _222 = _216.z;
    float _224 = _216.w;
    float _226 = _166 + _164;
    float _228 = -_166;
    bool _230 = _164 > _228;
    float _232 = 1.0 / _226;
    float _234 = _154 * _194;
    float _236 = _154 * _188;
    float _238 = _154 * _190;
    float _240 = _154 * _192;
    float _242 = fma(_152, _204, _234);
    float _244 = fma(_152, _198, _236);
    float _246 = fma(_152, _200, _238);
    float _248 = fma(_152, _202, _240);
    float _250 = fma(_158, _214, _242);
    float _252 = fma(_158, _208, _244);
    float _254 = _230 ? _232 : 1.0;
    float _256 = fma(_158, _210, _246);
    float _258 = fma(_158, _212, _248);
    float _260 = fma(_166, _224, _250);
    float _262 = fma(_166, _218, _252);
    float _264 = fma(_166, _220, _256);
    float _266 = fma(_166, _222, _258);
    float _268 = _260 * _254;
    float _270 = _262 * _254;
    float _272 = _264 * _254;
    float _274 = _266 * _254;
    out.m_36.x = _270;
    out.m_36.y = _272;
    out.m_36.z = _274;
    out.m_36.w = _268;
    out.m_38.x = _268;
    return out;
}

