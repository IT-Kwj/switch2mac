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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _87 * _79;
    float _97 = 1.0 / _89;
    float _99 = _87 * _85;
    float _101 = _91 * _97;
    float _103 = _93 * _97;
    float2 _428 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_428, float2(0.0), isnan(_428))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_428, float2(0.0), isnan(_428))).x;
    float2 _439 = float2(_95, _99);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_439, float2(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_439, float2(0.0), isnan(_439))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float _118 = in.m_35.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_41.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_43.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _144 = _87 * _122;
    float _146 = _144 * _97;
    float _148 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _148);
    float _152 = _87 * _128;
    float _154 = 1.0 / _150;
    float _156 = in.m_41.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_45.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_45.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_39.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_39.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_39.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = _87 * _184;
    float _194 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _196 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _194);
    float _198 = _116 * _152;
    float _200 = _87 * _134;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _204 = _154 * _202;
    float _206 = 1.0 / _196;
    float _208 = _200 * _198;
    float _210 = 0.0 + _208;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _216 = -_204;
    float _218 = fma(_206, _214, _216);
    float _220 = _218 * _142;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _87 * _140;
    float _226 = _212 * _222;
    float _228 = _226 * _224;
    bool _232 = _228 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _234 = isnan(_228);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _240 = _236 || _238;
    float _242 = in.m_41.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_45.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_41.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = _204;
    if (!_240)
    {
        discard_fragment();
    }
    float _262 = _87 * _166;
    float _264 = _110 * _110;
    float _266 = _112 * _112;
    float _268 = _114 * _114;
    float _270 = _87 * _190;
    float _272 = _87 * _246;
    float _274 = _87 * _160;
    float _276 = _87 * _252;
    float _278 = _87 * _258;
    float _280 = _87 * _172;
    float _282 = -_262;
    float _284 = _274 + _282;
    float _286 = -_276;
    float _288 = _272 + _286;
    float _290 = _87 * _178;
    float _292 = -_280;
    float _294 = _278 + _292;
    float _296 = fma(_266, _284, _262);
    float _298 = fma(_264, _288, _276);
    float _300 = fma(_268, _294, _280);
    float _302 = _296 * _192;
    float _304 = _298 * _290;
    float _306 = _300 * _270;
    float _308 = _268;
    if (!_240)
    {
        out.m_48.x = _304;
        out.m_48.y = _302;
        out.m_48.z = _306;
        out.m_48.w = _208;
        return out;
    }
    float _310 = _302 * 0.715200006961822509765625;
    float _312 = fma(_304, 0.2125999927520751953125, _310);
    float _314 = fma(_306, 0.072200000286102294921875, _312);
    bool _316 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _318 = 1.0 / _314;
    float _320 = 0.0 + _228;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = _322;
    if (_316)
    {
        float _326 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _328 = _204 + _326;
        _260 = _328;
    }
    float _330 = _260;
    float _332 = _318 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    if (_316)
    {
        float _336 = _330 * 8.0;
        float _338 = precise::clamp(_336, 0.0, 1.0);
        _308 = _338;
    }
    float _340 = _308;
    float _342 = fma(_334, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_316)
    {
        float _344 = _322 * _340;
        _324 = _344;
    }
    float _346 = _324;
    float _348 = _304 * _342;
    float _350 = _302 * _342;
    float _352 = _306 * _342;
    float _354 = 0.0 + _346;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    out.m_48.x = _348;
    out.m_48.y = _350;
    out.m_48.z = _352;
    out.m_48.w = _356;
    return out;
}

