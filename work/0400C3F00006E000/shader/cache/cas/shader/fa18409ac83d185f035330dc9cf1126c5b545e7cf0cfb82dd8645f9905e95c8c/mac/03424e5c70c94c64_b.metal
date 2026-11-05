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
    float2 _354 = float2(_75, _79);
    float4 _82 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_354, float2(0.0), isnan(_354)), int2(0), component::x).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_33.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _59 * _96;
    float _100 = -_84;
    float _102 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _104 = -_86;
    float _106 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _108 = -_88;
    float _110 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _112 = -_90;
    float _114 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _116 = 1.0 / _102;
    float _118 = 1.0 / _106;
    float _120 = 1.0 / _110;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _124 = _116 + _122;
    float _126 = -_116;
    float _128 = _126 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _130 = precise::max(0.0, _124);
    float _132 = 1.0 / _114;
    float _134 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _136 = _118 + _134;
    float _138 = -_118;
    float _140 = _138 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _142 = precise::max(_130, _128);
    float _144 = precise::max(0.0, _136);
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _148 = _120 + _146;
    float _150 = -_120;
    float _152 = _150 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _154 = precise::max(_144, _140);
    float _156 = precise::max(_142, _98);
    float _158 = precise::max(0.0, _148);
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _162 = _132 + _160;
    float _164 = precise::max(_154, _98);
    float _166 = -_132;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _170 = precise::max(_158, _152);
    float _172 = precise::max(0.0, _162);
    float _174 = precise::max(_170, _98);
    float _176 = _156 + _164;
    float _178 = precise::max(_172, _168);
    float _180 = _174 + _176;
    float _182 = precise::max(_178, _98);
    float _184 = -_182;
    bool _188 = _180 != _184;
    bool _190 = isnan(_180);
    bool _192 = _188 || _190;
    bool _194 = isnan(_184);
    bool _196 = _192 || _194;
    if (!_196)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        out.m_38.x = 0.0;
        return out;
    }
    float _198 = _79 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _200 = _75 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _543 = float2(_200, _198);
    float4 _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_543, float2(0.0), isnan(_543))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_543, float2(0.0), isnan(_543))).xyzw;
    float _204 = _202.x;
    float _206 = _202.y;
    float _208 = _202.z;
    float _210 = _202.w;
    float2 _559 = float2(_75, _198);
    float4 _212 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_559, float2(0.0), isnan(_559))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_559, float2(0.0), isnan(_559))).xyzw;
    float _214 = _212.x;
    float _216 = _212.y;
    float _218 = _212.z;
    float _220 = _212.w;
    float2 _575 = float2(_200, _79);
    float4 _222 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_575, float2(0.0), isnan(_575))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_575, float2(0.0), isnan(_575))).xyzw;
    float _224 = _222.x;
    float _226 = _222.y;
    float _228 = _222.z;
    float _230 = _222.w;
    float2 _591 = float2(_75, _79);
    float4 _232 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_591, float2(0.0), isnan(_591))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_591, float2(0.0), isnan(_591))).xyzw;
    float _234 = _232.x;
    float _236 = _232.y;
    float _238 = _232.z;
    float _240 = _232.w;
    float _242 = _182 + _180;
    float _244 = -_182;
    bool _246 = _180 > _244;
    float _248 = 1.0 / _242;
    float _250 = _164 * _210;
    float _252 = _164 * _204;
    float _254 = _164 * _206;
    float _256 = _164 * _208;
    float _258 = fma(_156, _220, _250);
    float _260 = fma(_156, _214, _252);
    float _262 = fma(_156, _216, _254);
    float _264 = fma(_156, _218, _256);
    float _266 = fma(_174, _230, _258);
    float _268 = fma(_174, _224, _260);
    float _270 = _246 ? _248 : 1.0;
    float _272 = fma(_174, _226, _262);
    float _274 = fma(_174, _228, _264);
    float _276 = fma(_182, _240, _266);
    float _278 = fma(_182, _234, _268);
    float _280 = fma(_182, _236, _272);
    float _282 = fma(_182, _238, _274);
    float _284 = _276 * _270;
    float _286 = _278 * _270;
    float _288 = _280 * _270;
    float _290 = _282 * _270;
    out.m_36.x = _286;
    out.m_36.y = _288;
    out.m_36.z = _290;
    out.m_36.w = _284;
    out.m_38.x = _284;
    return out;
}

