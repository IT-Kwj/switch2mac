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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c10 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_34 [[id(6)]];
    sampler fp_t_tcb_34Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_34Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_41 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _61;
    float _83 = _81 * _67;
    float _85 = _81 * _73;
    float _87 = 1.0 / (*spvDescriptorSet0.fp_c15)._m0[630].w;
    float _89 = _81 * _79;
    float _91 = 1.0 / _83;
    float _93 = _85 * _91;
    float _95 = _89 * _91;
    float _97 = _93 * _87;
    float _99 = _95 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _101 = _97 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float2 _469 = float2(_101, _99);
    float2 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_469, float2(0.0), isnan(_469))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_469, float2(0.0), isnan(_469))).xy;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = in.m_39.x;
    float _113 = in.m_41.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_41.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_43.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_43.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = -(*spvDescriptorSet0.fp_c10)._m0[3].x;
    float _139 = _137 + 1.0;
    float _141 = precise::max(_111, _139);
    float _143 = _81 * _117;
    float _145 = _81 * _123;
    float _147 = _109 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _149 = _107 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _151 = _81 * _129;
    float _153 = _81 * _135;
    float _155 = fma(_147, _141, _145);
    float _157 = fma(_149, _141, _143);
    float _159 = fma(_149, _141, _151);
    float _161 = fma(_147, _141, _153);
    float2 _559 = float2(_157, _155);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_559, float2(0.0), isnan(_559))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_559, float2(0.0), isnan(_559))).w;
    float2 _567 = float2(_159, _161);
    float4 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_567, float2(0.0), isnan(_567))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_567, float2(0.0), isnan(_567))).xyzw;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float _176 = in.m_45.w;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_47.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_49.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = _81 * _180;
    float _196 = in.m_45.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_45.z;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = -_139;
    float _210 = _208 + _163;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = precise::max(_212, 0.00999999977648258209228515625);
    float _216 = _174 * _194;
    float _218 = _81 * _186;
    float _220 = precise::min(_214, 0.0199999995529651641845703125);
    float _222 = _218 * _216;
    float _224 = fma(_220, 200.0, -2.0);
    float _226 = _81 * _192;
    float _228 = _222 * _224;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = _230 * _226;
    bool _236 = _232 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _238 = isnan(_232);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _244 = _240 || _242;
    float _246 = in.m_47.y;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_47.x;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_47.z;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    if (!_244)
    {
        discard_fragment();
    }
    float _264 = in.m_45.x;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = _168 * _168;
    float _272 = _172 * _172;
    float _274 = -_270;
    float _276 = _274 + 1.0;
    float _278 = -_272;
    float _280 = _278 + 1.0;
    float _282 = _81 * _250;
    float _284 = _170 * _170;
    float _286 = _81 * _256;
    float _288 = _81 * _262;
    float _290 = _81 * _206;
    float _292 = -_284;
    float _294 = _292 + 1.0;
    float _296 = _286 * _276;
    float _298 = _288 * _280;
    float _300 = _81 * _200;
    float _302 = _282 * _294;
    float _304 = fma(_272, _290, _298);
    float _306 = fma(_284, _300, _302);
    float _308 = _81 * _268;
    float _310 = fma(_270, _308, _296);
    if (!_244)
    {
        out.m_52.x = _310;
        out.m_52.y = _306;
        out.m_52.z = _304;
        out.m_52.w = _230;
        return out;
    }
    float _312 = in.m_54.w;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = _81 * _316;
    bool _320 = _318 != 1.0;
    bool _322 = isnan(_318);
    bool _324 = _320 || _322;
    bool _326 = isnan(1.0);
    bool _328 = _324 || _326;
    bool _330 = !_328;
    if (!_330)
    {
        float _332 = gl_FragCoord.x;
        float _334 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _336 = _332 / _334;
        float _338 = gl_FragCoord.y;
        float _340 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _342 = _338 / _340;
        float _344 = _318 * 256.0;
        float _346 = trunc(_344);
        int _349 = int(_346);
        float _351 = trunc(_336);
        int _353 = int(_351);
        float _355 = trunc(_342);
        int _357 = int(_355);
        int _359 = _353 + 2;
        int _361 = _359 >> 1;
        uint _364 = uint(int(uint(_357) >> uint(1)));
        int _366 = _361 ^ int(_364);
        int _368 = _366 << 16;
        int _370 = _368 ^ _361;
        int _372 = 983055 & _370;
        int _374 = _372 << 6;
        int _376 = _374 + _372;
        int _378 = _376 & 13369548;
        uint _380 = uint(int(uint(_378) >> uint(3)));
        int _382 = _378 | int(_380);
        uint _384 = uint(int(uint(_349) >> uint(7)));
        int _386 = int(_384) + _349;
        int _388 = _382 & 5570560;
        int _390 = _382 & 85;
        uint _392 = uint(int(uint(_388) >> uint(15)));
        int _394 = int(_392) + _390;
        bool _396 = uint(_386) > uint(_394);
        if (!_396)
        {
            discard_fragment();
        }
        if (!_396)
        {
            out.m_52.x = _310;
            out.m_52.y = _306;
            out.m_52.z = _304;
            out.m_52.w = _232;
            return out;
        }
    }
    float _398 = 0.0 + _232;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    out.m_52.x = 1.0;
    out.m_52.y = 1.0;
    out.m_52.z = 1.0;
    out.m_52.w = _400;
    return out;
}

