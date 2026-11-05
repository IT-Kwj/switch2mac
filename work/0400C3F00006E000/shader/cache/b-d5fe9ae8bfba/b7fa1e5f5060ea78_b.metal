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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _496 = false;
    bool _458 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float _61 = floor(_57);
    float _63 = floor(_59);
    float _65 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _67 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, -2.0, _65);
    float _69 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _71 = _65 + _69;
    float _73 = _65 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _75 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _77 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _79 = _75 + _77;
    float2 _701 = float2(_75, _67);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_701, float2(0.0), isnan(_701)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_701, float2(0.0), isnan(_701)), level(0.0)).x;
    float _83 = _75 + (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _85 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, -2.0, _75);
    float2 _720 = float2(_79, _67);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_720, float2(0.0), isnan(_720)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_720, float2(0.0), isnan(_720)), level(0.0)).x;
    float _89 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _75);
    float2 _733 = float2(_83, _67);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_733, float2(0.0), isnan(_733)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_733, float2(0.0), isnan(_733)), level(0.0)).x;
    float2 _741 = float2(_85, _67);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_741, float2(0.0), isnan(_741)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_741, float2(0.0), isnan(_741)), level(0.0)).x;
    float _95 = fma((*spvDescriptorSet0.fp_c3)._m0[3].z, 2.0, _65);
    float2 _753 = float2(_89, _67);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_753, float2(0.0), isnan(_753)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_753, float2(0.0), isnan(_753)), level(0.0)).x;
    float2 _761 = float2(_75, _71);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_761, float2(0.0), isnan(_761)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_761, float2(0.0), isnan(_761)), level(0.0)).x;
    float2 _769 = float2(_79, _65);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_769, float2(0.0), isnan(_769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_769, float2(0.0), isnan(_769)), level(0.0)).x;
    float2 _777 = float2(_79, _71);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_777, float2(0.0), isnan(_777)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_777, float2(0.0), isnan(_777)), level(0.0)).x;
    float2 _785 = float2(_85, _65);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_785, float2(0.0), isnan(_785)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_785, float2(0.0), isnan(_785)), level(0.0)).x;
    float2 _793 = float2(_85, _71);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_793, float2(0.0), isnan(_793)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_793, float2(0.0), isnan(_793)), level(0.0)).x;
    float2 _801 = float2(_75, _65);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_801, float2(0.0), isnan(_801)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_801, float2(0.0), isnan(_801)), level(0.0)).x;
    float2 _809 = float2(_83, _71);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_809, float2(0.0), isnan(_809)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_809, float2(0.0), isnan(_809)), level(0.0)).x;
    float2 _817 = float2(_83, _65);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_817, float2(0.0), isnan(_817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_817, float2(0.0), isnan(_817)), level(0.0)).x;
    float2 _825 = float2(_89, _71);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_825, float2(0.0), isnan(_825)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_825, float2(0.0), isnan(_825)), level(0.0)).x;
    float2 _833 = float2(_89, _65);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_833, float2(0.0), isnan(_833)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_833, float2(0.0), isnan(_833)), level(0.0)).x;
    float2 _841 = float2(_79, _95);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_841, float2(0.0), isnan(_841)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_841, float2(0.0), isnan(_841)), level(0.0)).x;
    float2 _849 = float2(_85, _95);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_849, float2(0.0), isnan(_849)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_849, float2(0.0), isnan(_849)), level(0.0)).x;
    float2 _857 = float2(_79, _73);
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_857, float2(0.0), isnan(_857)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_857, float2(0.0), isnan(_857)), level(0.0)).x;
    float2 _865 = float2(_75, _95);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_865, float2(0.0), isnan(_865)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_865, float2(0.0), isnan(_865)), level(0.0)).x;
    float2 _873 = float2(_85, _73);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_873, float2(0.0), isnan(_873)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_873, float2(0.0), isnan(_873)), level(0.0)).x;
    float2 _881 = float2(_75, _73);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_881, float2(0.0), isnan(_881)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_881, float2(0.0), isnan(_881)), level(0.0)).x;
    float2 _889 = float2(_83, _73);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_889, float2(0.0), isnan(_889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_889, float2(0.0), isnan(_889)), level(0.0)).x;
    float2 _897 = float2(_83, _95);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_897, float2(0.0), isnan(_897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_897, float2(0.0), isnan(_897)), level(0.0)).x;
    float2 _905 = float2(_89, _73);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_905, float2(0.0), isnan(_905)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_905, float2(0.0), isnan(_905)), level(0.0)).x;
    float2 _913 = float2(_89, _95);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_913, float2(0.0), isnan(_913)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_913, float2(0.0), isnan(_913)), level(0.0)).x;
    float _139 = in.m_31.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_31.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _55 * _143;
    float _153 = _55 * _149;
    float _155 = _151 * 0.5;
    float _157 = _153 * 0.5;
    float _159 = floor(_151);
    float _161 = floor(_153);
    float _163 = floor(_155);
    float _165 = floor(_157);
    float _167 = fma(_163, -2.0, _159);
    float _169 = fma(_165, -2.0, _161);
    float _171 = fma(_169, 2.0, _167);
    float _173 = trunc(_171);
    int _176 = int(_173);
    bool _180 = _176 >= 2;
    float _182 = _81 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _184 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[16].x, _182);
    float _186 = _87 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _188 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[16].z, _184);
    float _190 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[16].x, _186);
    float _192 = _99 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _194 = _101 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _196 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[16].w, _188);
    float _198 = _103 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _200 = _103 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _202 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[17].x, _192);
    float _204 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[17].x, _194);
    float _206 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[17].x, _198);
    float _208 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[16].x, _200);
    float _210 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[16].z, _190);
    float _212 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[17].z, _204);
    float _214 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[17].z, _206);
    float _216 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[16].z, _208);
    float _218 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[16].w, _210);
    float _220 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[17].w, _212);
    float _222 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[17].w, _214);
    float _224 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[16].w, _216);
    float _226 = _101 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _228 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[17].z, _202);
    float _230 = _218 + _222;
    float _232 = _109 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _234 = _224 + _220;
    float _236 = _101 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _238 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[17].w, _228);
    float _240 = _226 + _232;
    float _242 = _99 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _244 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[18].x, _236);
    float _246 = _196 + _238;
    float _248 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[18].z, _240);
    float _250 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[9].x, _242);
    float _252 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[18].z, _244);
    float _254 = _119 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _256 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[18].w, _248);
    float _258 = _125 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _260 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[18].w, _252);
    float _262 = _109 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _264 = _246 + _256;
    float _266 = _101 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _268 = _230 + _260;
    float _270 = _103 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _272 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[9].x, _262);
    float _274 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[9].x, _266);
    float _276 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[9].x, _266);
    float _278 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[9].x, _270);
    float _280 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[19].x, _254);
    float _282 = _109 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _284 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[9].z, _276);
    float _286 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[9].x, _262);
    float _288 = _101 * (*spvDescriptorSet0.fp_c3)._m0[17].x;
    float _290 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[9].z, _272);
    float _292 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[9].w, _284);
    float _294 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[19].x, _258);
    float _296 = _123 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _298 = _288 + _282;
    float _300 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[9].w, _290);
    float _302 = _129 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _304 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[18].x, _296);
    float _306 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[17].z, _298);
    float _308 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[9].z, _250);
    float _310 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[18].z, _304);
    float _312 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[9].z, _286);
    float _314 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[17].w, _306);
    float _316 = precise::min(_113, _131);
    float _318 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[18].w, _310);
    float _320 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[19].z, _280);
    float _322 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[9].w, _312);
    float _324 = _99 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _326 = _234 + _318;
    float _328 = _103 * (*spvDescriptorSet0.fp_c3)._m0[16].x;
    float _330 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[19].w, _320);
    float _332 = _328 + _324;
    float _334 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[16].z, _332);
    float _336 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[16].w, _334);
    float _338 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[18].x, _302);
    float _340 = _336 + _314;
    float _342 = _326 + _330;
    float _344 = _123 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _346 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[18].z, _338);
    float _348 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[19].x, _344);
    float _350 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[19].z, _348);
    float _352 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[19].w, _350);
    float _354 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[18].w, _346);
    float _356 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[19].z, _294);
    float _358 = _268 + _352;
    float _360 = _340 + _354;
    float _362 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[19].w, _356);
    float _364 = _123 * (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _366 = _129 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _368 = _364 + _366;
    float _370 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[19].z, _368);
    float _372 = _113 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _374 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[19].w, _370);
    float _376 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[9].x, _372);
    float _378 = _264 + _374;
    float _380 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[9].z, _376);
    float _382 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[9].w, _380);
    float _384 = _360 + _362;
    float _386 = _111 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _388 = precise::min(_103, _101);
    float _390 = precise::max(_113, _131);
    float _392 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[9].x, _386);
    float _394 = precise::min(_99, _123);
    float _396 = precise::min(_388, _394);
    float _398 = precise::min(_111, _129);
    float _400 = precise::min(_398, _316);
    float _402 = precise::max(_99, _123);
    float _404 = precise::min(_396, _400);
    float _406 = precise::max(_103, _101);
    float _408 = precise::min(_109, _404);
    float _410 = precise::max(_406, _402);
    float _412 = precise::max(_111, _129);
    float _414 = precise::max(_412, _390);
    float _416 = precise::max(_410, _414);
    float _418 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[9].z, _274);
    float _420 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[9].z, _278);
    float _422 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[9].z, _392);
    float _424 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[9].w, _418);
    float _426 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[9].w, _420);
    float _428 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[9].w, _308);
    float _430 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[9].w, _422);
    float _432 = precise::max(_109, _416);
    bool _434 = !_180;
    float _494;
    if (!_434)
    {
        bool _436 = _176 >= 3;
        float _438 = _129 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
        float _440 = _123 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
        float _442 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[9].x, _438);
        float _444 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[9].x, _440);
        float _446 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[9].z, _442);
        float _448 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[9].z, _444);
        float _450 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[9].w, _446);
        float _452 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[9].w, _448);
        bool _454 = !_436;
        if (!_454)
        {
            bool _456 = _176 != 3;
            _458 = _456;
            if (!_458)
            {
                float _460 = _428 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
                float _462 = fma(_424, (*spvDescriptorSet0.fp_c3)._m0[17].x, _282);
                float _464 = _322 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
                float _466 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[19].x, _366);
                float _468 = fma(_358, (*spvDescriptorSet0.fp_c3)._m0[16].x, _460);
                float _470 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[17].z, _462);
                float _472 = fma(_342, (*spvDescriptorSet0.fp_c3)._m0[18].x, _464);
                float _474 = fma(_450, (*spvDescriptorSet0.fp_c3)._m0[19].z, _466);
                float _476 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[16].z, _468);
                float _478 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[17].w, _470);
                float _480 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[18].z, _472);
                float _482 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[19].w, _474);
                float _484 = fma(_430, (*spvDescriptorSet0.fp_c3)._m0[16].w, _476);
                float _486 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[18].w, _480);
                float _488 = _484 + _478;
                float _490 = _488 + _486;
                float _492 = _490 + _482;
                _494 = _492;
                _496 = true;
            }
        }
        else
        {
            float _498 = _358 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
            float _500 = fma(_424, (*spvDescriptorSet0.fp_c3)._m0[17].y, _288);
            float _502 = _342 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
            float _504 = fma(_426, (*spvDescriptorSet0.fp_c3)._m0[16].x, _498);
            float _506 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[17].z, _500);
            float _508 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[18].x, _502);
            float _510 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[19].y, _364);
            float _512 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[16].z, _504);
            float _514 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[17].w, _506);
            float _516 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[18].z, _508);
            float _518 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[19].z, _510);
            float _520 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[16].w, _512);
            float _522 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[18].w, _516);
            float _524 = fma(_450, (*spvDescriptorSet0.fp_c3)._m0[19].w, _518);
            float _526 = _520 + _514;
            float _528 = _526 + _522;
            float _530 = _528 + _524;
            _494 = _530;
            _496 = true;
        }
    }
    if ((!_496) || _458)
    {
        bool _532;
        float _546;
        float _548;
        if (!_458)
        {
            _532 = _176 >= 1;
            float _534 = _99 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _536 = _103 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _538 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[9].x, _534);
            float _540 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[9].x, _536);
            float _542 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[9].z, _538);
            float _544 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[9].z, _540);
            _546 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[9].w, _542);
            _548 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[9].w, _544);
        }
        if ((!_532) || _458)
        {
            bool _550;
            if (!_458)
            {
                _550 = _176 != 0;
            }
            if ((!_550) && (!_458))
            {
                float _552 = _358 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
                float _554 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[16].y, _328);
                float _556 = _101 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
                float _558 = _342 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
                float _560 = fma(_426, (*spvDescriptorSet0.fp_c3)._m0[17].x, _552);
                float _562 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[16].z, _554);
                float _564 = fma(_424, (*spvDescriptorSet0.fp_c3)._m0[18].y, _556);
                float _566 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[19].x, _558);
                float _568 = fma(_428, (*spvDescriptorSet0.fp_c3)._m0[17].z, _560);
                float _570 = fma(_546, (*spvDescriptorSet0.fp_c3)._m0[16].w, _562);
                float _572 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[18].z, _564);
                float _574 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[19].z, _566);
                float _576 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[17].w, _568);
                float _578 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[18].w, _572);
                float _580 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[19].w, _574);
                float _582 = _570 + _576;
                float _584 = _582 + _578;
                float _586 = _584 + _580;
                _494 = _586;
                _496 = true;
            }
            else
            {
                _458 = false;
                _494 = 0.0;
                _496 = true;
            }
        }
        else
        {
            float _588 = _428 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
            float _590 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[16].x, _324);
            float _592 = fma(_424, (*spvDescriptorSet0.fp_c3)._m0[18].x, _232);
            float _594 = _322 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
            float _596 = fma(_358, (*spvDescriptorSet0.fp_c3)._m0[17].x, _588);
            float _598 = fma(_546, (*spvDescriptorSet0.fp_c3)._m0[16].z, _590);
            float _600 = fma(_300, (*spvDescriptorSet0.fp_c3)._m0[18].z, _592);
            float _602 = fma(_342, (*spvDescriptorSet0.fp_c3)._m0[19].x, _594);
            float _604 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[17].z, _596);
            float _606 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[16].w, _598);
            float _608 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[18].w, _600);
            float _610 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[19].z, _602);
            float _612 = fma(_430, (*spvDescriptorSet0.fp_c3)._m0[17].w, _604);
            float _614 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[19].w, _610);
            float _616 = _606 + _612;
            float _618 = _616 + _608;
            float _620 = _618 + _614;
            _494 = _620;
        }
    }
    _496 = false;
    float _622 = _494;
    float _624 = precise::max(_408, _622);
    float _626 = precise::min(_432, _624);
    out.m_34.x = _626;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = 0.0;
    return out;
}

