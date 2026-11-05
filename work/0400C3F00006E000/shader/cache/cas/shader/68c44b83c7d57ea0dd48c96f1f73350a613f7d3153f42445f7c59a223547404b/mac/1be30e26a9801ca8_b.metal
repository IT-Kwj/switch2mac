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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.w;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _59 = _57 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _61 = fma(_59, 0.5, -0.5);
    float _63 = precise::clamp(_61, 0.0, 1.0);
    bool _67 = _63 > 0.0;
    bool _69 = isnan(_63);
    bool _71 = _67 || _69;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    float _77 = 1.0 / _43;
    int _80 = as_type<int>(_59);
    if (!_75)
    {
        _80 = 1065353216;
    }
    int _82 = _80;
    float _84 = _77 * _49;
    float _86 = _77 * _55;
    if (!_75)
    {
        out.m_36.x = as_type<float>(_82);
        return out;
    }
    float2 _491 = float2(_84, _86);
    float2 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_491, float2(0.0), isnan(_491))).xy;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = in.m_33.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_33.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _57 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _110 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _112 = _57 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _114 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _116 = _57 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _118 = _57 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _120 = _77 * _100;
    float _122 = _77 * _106;
    float _124 = fma(_94, 2.0, -1.0);
    float _126 = fma(_92, 2.0, -1.0);
    float _128 = _124 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _130 = _126 * _108;
    float _132 = _126 * _110;
    float _134 = _128 * _110;
    float _136 = _128 * _108;
    float _138 = _128 * _112;
    float _140 = _126 * _112;
    float _142 = _126 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _144 = fma(_124, _114, _132);
    float _146 = fma(_124, _118, _130);
    float _148 = fma(_124, _116, _140);
    float _150 = -_134;
    float _152 = fma(_142, _114, _150);
    float _154 = -_136;
    float _156 = fma(_142, _118, _154);
    float _158 = -_138;
    float _160 = fma(_142, _116, _158);
    float _162 = -_144;
    float _164 = _122 + _162;
    float _166 = _122 + _144;
    float _168 = _122 + _148;
    float _170 = -_148;
    float _172 = _122 + _170;
    float _174 = -_152;
    float _176 = _120 + _174;
    float _178 = _120 + _152;
    float _180 = _120 + _156;
    float _182 = -_156;
    float _184 = _120 + _182;
    float _186 = _120 + _160;
    float _188 = -_160;
    float _190 = _120 + _188;
    float _192 = _122 + _146;
    float2 _658 = float2(_120, _122);
    float _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_658, float2(0.0), isnan(_658))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_658, float2(0.0), isnan(_658))).x;
    float2 _666 = float2(_176, _164);
    float _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_666, float2(0.0), isnan(_666))).x;
    float2 _674 = float2(_178, _166);
    float _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_674, float2(0.0), isnan(_674))).x;
    float _200 = -_146;
    float _202 = _122 + _200;
    float2 _687 = float2(_184, _202);
    float _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_687, float2(0.0), isnan(_687))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_687, float2(0.0), isnan(_687))).x;
    float2 _695 = float2(_180, _192);
    float _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_695, float2(0.0), isnan(_695))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_695, float2(0.0), isnan(_695))).x;
    float2 _703 = float2(_186, _168);
    float _208 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_703, float2(0.0), isnan(_703))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_703, float2(0.0), isnan(_703))).x;
    float2 _711 = float2(_190, _172);
    float _210 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_711, float2(0.0), isnan(_711))).x;
    float _212 = 1.0 / _57;
    float _214 = _212 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _216 = _212 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _218 = _212 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _220 = _214 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _222 = _216 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _226 = 0.5 * _220;
    float _228 = 0.5 * _222;
    float _230 = 0.5 * _224;
    float _232 = -_196;
    float _234 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _232);
    float _236 = -_198;
    float _238 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _236);
    float _240 = fma(_234, _226, 0.5);
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = fma(_238, _226, 0.5);
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = -_238;
    float _250 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = -_234;
    float _256 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = -_246;
    float _262 = _260 + 0.5;
    float _264 = -_242;
    float _266 = _264 + 0.5;
    float _268 = -_204;
    float _270 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _268);
    float _272 = -_206;
    float _274 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _272);
    float _276 = fma(_252, _262, 0.5);
    float _278 = fma(_258, _266, 0.5);
    float _280 = fma(_270, _228, 0.5);
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = -_270;
    float _286 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = -_276;
    float _292 = _242 + _290;
    float _294 = -_278;
    float _296 = _246 + _294;
    float _298 = -_282;
    float _300 = _298 + 0.5;
    float _302 = -_208;
    float _304 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _302);
    float _306 = fma(_258, _292, _276);
    float _308 = fma(_274, _228, 0.5);
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = -_274;
    float _314 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = -_210;
    float _320 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _318);
    float _322 = fma(_288, _300, 0.5);
    float _324 = -_310;
    float _326 = _324 + 0.5;
    float _328 = fma(_252, _296, _278);
    float _330 = fma(_304, _230, 0.5);
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = fma(_320, _230, 0.5);
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = fma(_316, _326, 0.5);
    float _340 = -_304;
    float _342 = fma(_340, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = -_320;
    float _348 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = -_322;
    float _354 = _310 + _352;
    float _356 = -_338;
    float _358 = _282 + _356;
    float _360 = -_336;
    float _362 = _360 + 0.5;
    float _364 = -_332;
    float _366 = _364 + 0.5;
    float _368 = fma(_316, _354, _322);
    float _370 = fma(_288, _358, _338);
    float _372 = fma(_350, _362, 0.5);
    float _374 = fma(_344, _366, 0.5);
    float _376 = _328 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _378 = _306 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _380 = -_372;
    float _382 = _332 + _380;
    float _384 = -_374;
    float _386 = _336 + _384;
    float _388 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[6].w, _376);
    float _390 = fma(_370, (*spvDescriptorSet0.fp_c3)._m0[6].w, _378);
    float _392 = fma(_344, _382, _372);
    float _394 = fma(_350, _386, _374);
    float _396 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[7].w, _388);
    float _398 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[7].w, _390);
    float _400 = _396 + _398;
    float _402 = _400 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _404 = _402 + (-0.5);
    float _406 = _404 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = -_408;
    float _412 = fma(_63, _410, 1.0);
    out.m_36.x = _412;
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.w;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _59 = _57 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _61 = fma(_59, 0.5, -0.5);
    float _63 = precise::clamp(_61, 0.0, 1.0);
    bool _67 = _63 > 0.0;
    bool _69 = isnan(_63);
    bool _71 = _67 || _69;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    float _77 = 1.0 / _43;
    int _80 = as_type<int>(_59);
    if (!_75)
    {
        _80 = 1065353216;
    }
    int _82 = _80;
    float _84 = _77 * _49;
    float _86 = _77 * _55;
    if (!_75)
    {
        out.m_36.x = as_type<float>(_82);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float2 _491 = float2(_84, _86);
    float2 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_491, float2(0.0), isnan(_491))).xy;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = in.m_33.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_33.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _57 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _110 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _112 = _57 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _114 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _116 = _57 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _118 = _57 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _120 = _77 * _100;
    float _122 = _77 * _106;
    float _124 = fma(_94, 2.0, -1.0);
    float _126 = fma(_92, 2.0, -1.0);
    float _128 = _124 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _130 = _126 * _108;
    float _132 = _126 * _110;
    float _134 = _128 * _110;
    float _136 = _128 * _108;
    float _138 = _128 * _112;
    float _140 = _126 * _112;
    float _142 = _126 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _144 = fma(_124, _114, _132);
    float _146 = fma(_124, _118, _130);
    float _148 = fma(_124, _116, _140);
    float _150 = -_134;
    float _152 = fma(_142, _114, _150);
    float _154 = -_136;
    float _156 = fma(_142, _118, _154);
    float _158 = -_138;
    float _160 = fma(_142, _116, _158);
    float _162 = -_144;
    float _164 = _122 + _162;
    float _166 = _122 + _144;
    float _168 = _122 + _148;
    float _170 = -_148;
    float _172 = _122 + _170;
    float _174 = -_152;
    float _176 = _120 + _174;
    float _178 = _120 + _152;
    float _180 = _120 + _156;
    float _182 = -_156;
    float _184 = _120 + _182;
    float _186 = _120 + _160;
    float _188 = -_160;
    float _190 = _120 + _188;
    float _192 = _122 + _146;
    float2 _658 = float2(_120, _122);
    float _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_658, float2(0.0), isnan(_658))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_658, float2(0.0), isnan(_658))).x;
    float2 _666 = float2(_176, _164);
    float _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_666, float2(0.0), isnan(_666))).x;
    float2 _674 = float2(_178, _166);
    float _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_674, float2(0.0), isnan(_674))).x;
    float _200 = -_146;
    float _202 = _122 + _200;
    float2 _687 = float2(_184, _202);
    float _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_687, float2(0.0), isnan(_687))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_687, float2(0.0), isnan(_687))).x;
    float2 _695 = float2(_180, _192);
    float _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_695, float2(0.0), isnan(_695))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_695, float2(0.0), isnan(_695))).x;
    float2 _703 = float2(_186, _168);
    float _208 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_703, float2(0.0), isnan(_703))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_703, float2(0.0), isnan(_703))).x;
    float2 _711 = float2(_190, _172);
    float _210 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_711, float2(0.0), isnan(_711))).x;
    float _212 = 1.0 / _57;
    float _214 = _212 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _216 = _212 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _218 = _212 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _220 = _214 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _222 = _216 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _226 = 0.5 * _220;
    float _228 = 0.5 * _222;
    float _230 = 0.5 * _224;
    float _232 = -_196;
    float _234 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _232);
    float _236 = -_198;
    float _238 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _236);
    float _240 = fma(_234, _226, 0.5);
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = fma(_238, _226, 0.5);
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = -_238;
    float _250 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = -_234;
    float _256 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = -_246;
    float _262 = _260 + 0.5;
    float _264 = -_242;
    float _266 = _264 + 0.5;
    float _268 = -_204;
    float _270 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _268);
    float _272 = -_206;
    float _274 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _272);
    float _276 = fma(_252, _262, 0.5);
    float _278 = fma(_258, _266, 0.5);
    float _280 = fma(_270, _228, 0.5);
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = -_270;
    float _286 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = -_276;
    float _292 = _242 + _290;
    float _294 = -_278;
    float _296 = _246 + _294;
    float _298 = -_282;
    float _300 = _298 + 0.5;
    float _302 = -_208;
    float _304 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _302);
    float _306 = fma(_258, _292, _276);
    float _308 = fma(_274, _228, 0.5);
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = -_274;
    float _314 = fma(_312, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = -_210;
    float _320 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[1].z, _318);
    float _322 = fma(_288, _300, 0.5);
    float _324 = -_310;
    float _326 = _324 + 0.5;
    float _328 = fma(_252, _296, _278);
    float _330 = fma(_304, _230, 0.5);
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = fma(_320, _230, 0.5);
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = fma(_316, _326, 0.5);
    float _340 = -_304;
    float _342 = fma(_340, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = -_320;
    float _348 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = -_322;
    float _354 = _310 + _352;
    float _356 = -_338;
    float _358 = _282 + _356;
    float _360 = -_336;
    float _362 = _360 + 0.5;
    float _364 = -_332;
    float _366 = _364 + 0.5;
    float _368 = fma(_316, _354, _322);
    float _370 = fma(_288, _358, _338);
    float _372 = fma(_350, _362, 0.5);
    float _374 = fma(_344, _366, 0.5);
    float _376 = _328 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _378 = _306 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _380 = -_372;
    float _382 = _332 + _380;
    float _384 = -_374;
    float _386 = _336 + _384;
    float _388 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[6].w, _376);
    float _390 = fma(_370, (*spvDescriptorSet0.fp_c3)._m0[6].w, _378);
    float _392 = fma(_344, _382, _372);
    float _394 = fma(_350, _386, _374);
    float _396 = fma(_392, (*spvDescriptorSet0.fp_c3)._m0[7].w, _388);
    float _398 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[7].w, _390);
    float _400 = _396 + _398;
    float _402 = _400 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _404 = _402 + (-0.5);
    float _406 = _404 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = -_408;
    float _412 = fma(_63, _410, 1.0);
    out.m_36.x = _412;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

