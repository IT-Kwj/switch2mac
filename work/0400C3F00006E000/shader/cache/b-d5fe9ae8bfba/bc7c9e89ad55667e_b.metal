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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _330 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_330, float2(0.0), isnan(_330))).x;
    float2 _342 = float2(_59, _61);
    float4 _66 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_342, float2(0.0), isnan(_342)), int2(0), component::x).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = in.m_33.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_33.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = _57 * _80;
    float _90 = _57 * _86;
    float _92 = floor(_90);
    float _94 = -_92;
    float _96 = _90 + _94;
    float _98 = -_63;
    float _100 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _102 = -_70;
    float _104 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _106 = -_72;
    float _108 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _110 = -_74;
    float _112 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _114 = -_68;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _118 = 1.0 / _100;
    float _120 = 1.0 / _116;
    float _122 = 1.0 / _104;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _126 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].w, _124);
    float _128 = 1.0 / _108;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _132 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[0].w, _130);
    float _134 = -_126;
    float _136 = _134 + _132;
    float _138 = 1.0 / _112;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _142 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[0].w, _140);
    float _144 = -_126;
    float _146 = _144 + _142;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _150 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[0].w, _148);
    float _152 = abs(_146);
    float _154 = fma(_152, -100.0, 1.0);
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = -_126;
    float _160 = _158 + _150;
    float _162 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _164 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[0].w, _162);
    float _166 = abs(_136);
    float _168 = abs(_160);
    float _170 = precise::min(_166, _168);
    float _172 = floor(_88);
    float _174 = abs(_136);
    float _176 = fma(_174, -100.0, 1.0);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = -_126;
    float _182 = _180 + _164;
    float _184 = abs(_160);
    float _186 = fma(_184, -100.0, 1.0);
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = abs(_146);
    float _192 = -_190;
    float _194 = _192 + _170;
    float _196 = abs(_182);
    float _198 = fma(_196, -100.0, 1.0);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = abs(_146);
    float _204 = abs(_182);
    float _206 = precise::min(_202, _204);
    float _208 = _178 * _188;
    float _210 = _194 * 100.0;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = _156 * _200;
    float _216 = abs(_146);
    float _218 = -_216;
    float _220 = abs(_182);
    float _222 = _218 + _220;
    float _224 = abs(_160);
    float _226 = -_224;
    float _228 = _226 + _206;
    float _230 = abs(_136);
    float _232 = abs(_160);
    float _234 = -_232;
    float _236 = _230 + _234;
    float _238 = _214 * _212;
    float _240 = abs(_136);
    float _242 = -_240;
    float _244 = -_222;
    float _246 = _242 + _244;
    float _248 = _228 * 100.0;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = abs(_182);
    float _254 = -_252;
    float _256 = -_236;
    float _258 = _254 + _256;
    float _260 = fma(_238, _246, _222);
    float _262 = _208 * _250;
    float _264 = fma(_262, _258, _236);
    float _266 = -_172;
    float _268 = _88 + _266;
    float _270 = _100 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _272 = _260 + _264;
    float _274 = -_264;
    float _276 = _260 + _274;
    float _278 = fma(_272, _270, _96);
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = fma(_276, _270, _268);
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = -_96;
    float _288 = _286 + _280;
    float _290 = -_268;
    float _292 = _290 + _284;
    float _294 = fma(_288, 0.5, 0.5);
    float _296 = fma(_292, 0.5, 0.5);
    out.m_36.x = _294;
    out.m_36.y = _296;
    return out;
}

