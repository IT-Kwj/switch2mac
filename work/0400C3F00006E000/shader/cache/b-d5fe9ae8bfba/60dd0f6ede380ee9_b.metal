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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float _67 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[8].z, -0.5);
    float _69 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[8].w, -0.5);
    float _71 = floor(_67);
    float _73 = floor(_69);
    float _75 = _71 + 0.5;
    float _77 = _75 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _79 = _73 + 0.5;
    float _81 = _79 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float2 _342 = float2(_77, _81);
    float4 _84 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_342, float2(0.0), isnan(_342)), int2(0), component::x).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float2 _361 = float2(_63, _65);
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_361, float2(0.0), isnan(_361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_361, float2(0.0), isnan(_361))).x;
    float _96 = in.m_35.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _61 * _100;
    float _104 = -_86;
    float _106 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _108 = -_88;
    float _110 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _112 = -_90;
    float _114 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _116 = -_92;
    float _118 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _120 = 1.0 / _106;
    float _122 = 1.0 / _110;
    float _124 = 1.0 / _114;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _128 = _120 + _126;
    float _130 = precise::max(0.0, _128);
    float _132 = 1.0 / _118;
    float _134 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _136 = _122 + _134;
    float _138 = precise::max(_130, _94);
    float _140 = precise::max(0.0, _136);
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _144 = _124 + _142;
    float _146 = precise::max(_138, _102);
    float _148 = precise::max(_140, _94);
    float _150 = precise::max(0.0, _144);
    float _152 = precise::max(_148, _102);
    float _154 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _156 = _132 + _154;
    float _158 = precise::max(_150, _94);
    float _160 = precise::max(0.0, _156);
    float _162 = precise::max(_158, _102);
    float _164 = _146 + _152;
    float _166 = precise::max(_160, _94);
    float _168 = _162 + _164;
    float _170 = precise::max(_166, _102);
    float _172 = -_170;
    bool _176 = _168 != _172;
    bool _178 = isnan(_168);
    bool _180 = _176 || _178;
    bool _182 = isnan(_172);
    bool _184 = _180 || _182;
    if (!_184)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        out.m_40.x = 0.0;
        return out;
    }
    float _186 = _81 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _188 = _77 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _515 = float2(_188, _186);
    float4 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_515, float2(0.0), isnan(_515))).xyzw;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = _190.w;
    float2 _531 = float2(_77, _186);
    float4 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).xyzw;
    float _202 = _200.x;
    float _204 = _200.y;
    float _206 = _200.z;
    float _208 = _200.w;
    float2 _547 = float2(_188, _81);
    float4 _210 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_547, float2(0.0), isnan(_547))).xyzw;
    float _212 = _210.x;
    float _214 = _210.y;
    float _216 = _210.z;
    float _218 = _210.w;
    float2 _563 = float2(_77, _81);
    float4 _220 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_563, float2(0.0), isnan(_563))).xyzw;
    float _222 = _220.x;
    float _224 = _220.y;
    float _226 = _220.z;
    float _228 = _220.w;
    float _230 = _170 + _168;
    float _232 = -_170;
    bool _234 = _168 > _232;
    float _236 = 1.0 / _230;
    float _238 = _152 * _198;
    float _240 = _152 * _192;
    float _242 = _152 * _194;
    float _244 = _152 * _196;
    float _246 = fma(_146, _208, _238);
    float _248 = fma(_146, _202, _240);
    float _250 = fma(_146, _204, _242);
    float _252 = fma(_146, _206, _244);
    float _254 = fma(_162, _218, _246);
    float _256 = fma(_162, _212, _248);
    float _258 = _234 ? _236 : 1.0;
    float _260 = fma(_162, _214, _250);
    float _262 = fma(_162, _216, _252);
    float _264 = fma(_170, _228, _254);
    float _266 = fma(_170, _222, _256);
    float _268 = fma(_170, _224, _260);
    float _270 = fma(_170, _226, _262);
    float _272 = _264 * _258;
    float _274 = _266 * _258;
    float _276 = _268 * _258;
    float _278 = _270 * _258;
    out.m_38.x = _274;
    out.m_38.y = _276;
    out.m_38.z = _278;
    out.m_38.w = _272;
    out.m_40.x = _272;
    return out;
}

