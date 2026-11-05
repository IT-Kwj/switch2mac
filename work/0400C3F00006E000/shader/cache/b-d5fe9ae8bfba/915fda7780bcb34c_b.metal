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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_38 [[id(3)]];
    sampler fp_t_tcb_38Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_38Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
    float4 m_25 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_27 [[user(locn5)]];
    float4 m_37 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_25.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_25.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_27.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_27.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _47;
    float _75 = _73 * _53;
    float _77 = _73 * _59;
    float _79 = _73 * _65;
    float _81 = _73 * _71;
    float2 _396 = float2(_75, _77);
    float4 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_396, float2(0.0), isnan(_396))).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float2 _415 = float2(_79, _81);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_38.sample(spvDescriptorSet0.fp_t_tcb_38Smplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_38, spvDescriptorSet0.fp_t_tcb_38Smplr_w, select(_415, float2(0.0), isnan(_415))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float _104 = in.m_29.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_31.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_31.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_29.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_31.z;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_29.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_33.w;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_31.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_33.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_33.y;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_33.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_35.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_37.w;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = _73 * _108;
    float _184 = _73 * _114;
    float _186 = _73 * _120;
    float _188 = _73 * _126;
    float _190 = _73 * _132;
    float _192 = _73 * _138;
    float _194 = _73 * _144;
    float _196 = _73 * _150;
    float _198 = _73 * _156;
    float _200 = _73 * _162;
    float _202 = _73 * _168;
    float _204 = _73 * _174;
    float _206 = _73 * _180;
    float _208 = -_182;
    float _210 = _186 + _208;
    float _212 = -_188;
    float _214 = _184 + _212;
    float _216 = -_192;
    float _218 = _190 + _216;
    bool _222 = _206 != 1.0;
    bool _224 = isnan(_206);
    bool _226 = _222 || _224;
    bool _228 = isnan(1.0);
    bool _230 = _226 || _228;
    float _232 = _86 * _86;
    float _234 = _88 * _88;
    float _236 = _96 * _96;
    float _238 = _98 * _98;
    float _240 = _90 * _90;
    float _242 = _100 * _100;
    float _244 = _92 * _102;
    float _246 = _232 * _236;
    float _248 = _234 * _238;
    float _250 = _240 * _242;
    float _252 = _244 * _194;
    float _254 = fma(_246, _210, _182);
    float _256 = fma(_248, _214, _188);
    float _258 = fma(_250, _218, _192);
    float _260 = _196 * _252;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _254 * _198;
    float _266 = _256 * _200;
    float _268 = _258 * _202;
    float _270 = _262 * _204;
    bool _272 = !_230;
    if (!_272)
    {
        float _274 = gl_FragCoord.x;
        float _276 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _278 = _274 / _276;
        float _280 = gl_FragCoord.y;
        float _282 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _284 = _280 / _282;
        float _286 = trunc(_278);
        int _289 = int(_286);
        float _291 = trunc(_284);
        int _293 = int(_291);
        int _295 = _289 + 2;
        int _297 = _295 >> 1;
        uint _300 = uint(int(uint(_293) >> uint(1)));
        int _302 = _297 ^ int(_300);
        int _304 = _302 << 16;
        int _306 = _304 ^ _297;
        int _308 = 983055 & _306;
        float _310 = _206 * 256.0;
        int _312 = _308 << 6;
        int _314 = _312 + _308;
        float _316 = trunc(_310);
        int _318 = int(_316);
        int _320 = _314 & 13369548;
        uint _322 = uint(int(uint(_320) >> uint(3)));
        int _324 = _320 | int(_322);
        int _326 = _324 & 5570560;
        int _328 = _324 & 85;
        uint _330 = uint(int(uint(_318) >> uint(7)));
        int _332 = int(_330) + _318;
        uint _334 = uint(int(uint(_326) >> uint(15)));
        int _336 = int(_334) + _328;
        bool _338 = uint(_332) > uint(_336);
        if (!_338)
        {
            discard_fragment();
        }
        if (!_338)
        {
            out.m_40.x = _264;
            out.m_40.y = _266;
            out.m_40.z = _268;
            out.m_40.w = _270;
            return out;
        }
    }
    float _340 = 0.0 + _270;
    float _342 = precise::clamp(_340, 0.0, 1.0);
    out.m_40.x = 1.0;
    out.m_40.y = 1.0;
    out.m_40.z = 1.0;
    out.m_40.w = _342;
    return out;
}

