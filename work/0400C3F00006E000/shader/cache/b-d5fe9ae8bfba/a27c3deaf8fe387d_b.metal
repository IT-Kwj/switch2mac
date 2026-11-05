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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.w;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _39;
    float _67 = _65 * _45;
    float _69 = _65 * _51;
    float _71 = _65 * _57;
    float _73 = _65 * _63;
    float2 _385 = float2(_67, _69);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _402 = float2(_67, _69);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_402, float2(0.0), isnan(_402)), int2(0, 1)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _418 = float2(_67, _69);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_418, float2(0.0), isnan(_418)), int2(1, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _433 = float2(_67, _69);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_433, float2(0.0), isnan(_433)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_433, float2(0.0), isnan(_433)), int2(1)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _448 = float2(_71, _73);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float _120 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _122 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _124 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _126 = _105 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _128 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
    float _130 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
    float _132 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
    float _134 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
    float _136 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
    float _138 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
    float _140 = _114 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _142 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
    float _144 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
    float _146 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _140);
    float _148 = precise::min(_136, _138);
    float _150 = precise::min(_142, _144);
    float _152 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[2].z, _146);
    float _154 = precise::max(_136, _138);
    float _156 = precise::max(_142, _144);
    float _158 = precise::min(_148, _150);
    float _160 = precise::max(_154, _156);
    float _162 = precise::min(_152, _158);
    float _164 = precise::max(_152, _160);
    float _166 = _160 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _168 = -_162;
    float _170 = _168 + _164;
    float _172 = precise::max(_166, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _176 = _170 > _172;
    if (!_176)
    {
        out.m_32.x = _112;
        out.m_32.y = _114;
        out.m_32.z = _116;
        out.m_32.w = _118;
        return out;
    }
    float _178 = _136 + _142;
    float _180 = -_142;
    float _182 = _180 + _138;
    float _184 = -_136;
    float _186 = _184 + _144;
    float _188 = _138 + _178;
    float _190 = _182 + _186;
    float _192 = -_186;
    float _194 = _182 + _192;
    float _196 = _144 + _188;
    float _198 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
    float _200 = abs(_190);
    float _202 = abs(_194);
    float _204 = precise::min(_200, _202);
    float _206 = fma(_196, _198, (*spvDescriptorSet0.fp_c3)._m0[4].w);
    float _208 = precise::max(_206, _204);
    float _210 = 1.0 / _208;
    float _212 = _190 * _210;
    float _214 = _194 * _210;
    float _216 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _218 = precise::max(_212, _216);
    float _220 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _222 = precise::max(_214, _220);
    float _224 = precise::min(_218, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _226 = precise::min(_222, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _228 = -_224;
    float _230 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _232 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _234 = -_226;
    float _236 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float _238 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float2 _688 = float2(_230, _236);
    float4 _240 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_688, float2(0.0), isnan(_688))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_688, float2(0.0), isnan(_688))).xyzw;
    float _242 = _240.x;
    float _244 = _240.y;
    float _246 = _240.z;
    float _248 = _240.w;
    float2 _704 = float2(_232, _238);
    float4 _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_704, float2(0.0), isnan(_704))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_704, float2(0.0), isnan(_704))).xyzw;
    float _252 = _250.x;
    float _254 = _250.y;
    float _256 = _250.z;
    float _258 = _250.w;
    float _260 = -_242;
    float _262 = _260 + _252;
    float _264 = -_244;
    float _266 = _264 + _254;
    float _268 = -_246;
    float _270 = _268 + _256;
    float _272 = -_248;
    float _274 = _272 + _258;
    float _276 = fma(_262, 0.5, _242);
    float _278 = fma(_266, 0.5, _244);
    float _280 = fma(_270, 0.5, _246);
    float _282 = fma(_274, 0.5, _248);
    float _284 = -_276;
    float _286 = _112 + _284;
    float _288 = -_278;
    float _290 = _114 + _288;
    float _292 = -_280;
    float _294 = _116 + _292;
    float _296 = -_282;
    float _298 = _118 + _296;
    float _300 = fma(_286, 0.3499999940395355224609375, _276);
    float _302 = fma(_290, 0.3499999940395355224609375, _278);
    float _304 = fma(_294, 0.3499999940395355224609375, _280);
    float _306 = fma(_298, 0.3499999940395355224609375, _282);
    float _308 = -_300;
    float _310 = _112 + _308;
    float _312 = -_302;
    float _314 = _114 + _312;
    float _316 = -_304;
    float _318 = _116 + _316;
    float _320 = -_306;
    float _322 = _118 + _320;
    float _324 = fma(_310, (*spvDescriptorSet0.fp_c3)._m0[5].x, _300);
    float _326 = fma(_314, (*spvDescriptorSet0.fp_c3)._m0[5].x, _302);
    float _328 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[5].x, _304);
    float _330 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[5].x, _306);
    out.m_32.x = _324;
    out.m_32.y = _326;
    out.m_32.z = _328;
    out.m_32.w = _330;
    return out;
}

