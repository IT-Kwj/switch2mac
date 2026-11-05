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
    constant _16* fp_c11 [[id(1)]];
    texture2d_array<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_31 [[user(locn7)]];
    float4 m_37 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _49;
    float _89 = _87 * _55;
    float _91 = _87 * _61;
    float _93 = _87 * _73;
    float _95 = in.m_33.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = floor(_89);
    float _103 = _87 * _79;
    float _105 = floor(_91);
    float _107 = -_101;
    float _109 = _89 + _107;
    float _111 = precise::max((*spvDescriptorSet0.fp_c11)._m0[40].x, 2.0);
    float _113 = _111 + (-1.0);
    float _115 = -_105;
    float _117 = _91 + _115;
    float _119 = in.m_35.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = -_117;
    float _127 = _109 + _125;
    float _129 = _87 * _99;
    float _131 = ceil(_127);
    float _133 = -_131;
    float _135 = _133 + 1.0;
    float _137 = _101 + _131;
    float _139 = _105 + _135;
    float _141 = precise::min(_113, _137);
    float _143 = precise::min(_113, _139);
    float _145 = _87 * _123;
    float _147 = fma(_111, _143, _141);
    float _149 = _101 + 1.0;
    float _151 = _105 + 1.0;
    float _153 = fma(_105, _111, _101);
    float _155 = _87 * _67;
    float _157 = rint(_147);
    float _159 = precise::max(_157, 0.0);
    uint _162 = uint(_159);
    uint _164 = clamp(_162, 0u, 65535u);
    float _166 = precise::min(_113, _149);
    float _168 = precise::min(_113, _151);
    float _170 = fma(_111, _168, _166);
    float _172 = rint(_153);
    float _174 = precise::max(_172, 0.0);
    uint _176 = uint(_174);
    uint _178 = clamp(_176, 0u, 65535u);
    float _180 = _87 * _85;
    float _182 = rint(_170);
    float _184 = precise::max(_182, 0.0);
    uint _186 = uint(_184);
    uint _188 = clamp(_186, 0u, 65535u);
    float3 _601 = float3(_155, _93, float(int(_164)));
    float3 _605 = select(_601, float3(0.0), isnan(_601));
    float _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _605.xy, uint(rint(_605.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _605.xy, uint(rint(_605.z))).w;
    float3 _614 = float3(_129, _103, float(int(_178)));
    float3 _616 = select(_614, float3(0.0), isnan(_614));
    float _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _616.xy, uint(rint(_616.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _616.xy, uint(rint(_616.z))).w;
    float3 _625 = float3(_145, _180, float(int(_188)));
    float3 _627 = select(_625, float3(0.0), isnan(_625));
    float _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _627.xy, uint(rint(_627.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _627.xy, uint(rint(_627.z))).w;
    float _196 = in.m_37.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_37.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_31.w;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_31.z;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_37.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_37.w;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = _87 * _200;
    float _234 = _87 * _206;
    float _236 = _190 + (-0.5);
    float _238 = fma(_232, _236, _93);
    float _240 = fma(_234, _236, _155);
    float _242 = _87 * _212;
    float _244 = _192 + (-0.5);
    float _246 = _87 * _218;
    float _248 = _87 * _230;
    float _250 = fma(_242, _244, _103);
    float _252 = _87 * _224;
    float _254 = fma(_246, _244, _129);
    float _256 = _194 + (-0.5);
    float3 _719 = float3(_240, _238, float(int(_164)));
    float3 _721 = select(_719, float3(0.0), isnan(_719));
    float _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _721.xy, uint(rint(_721.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _721.xy, uint(rint(_721.z))).w;
    float3 _730 = float3(_254, _250, float(int(_178)));
    float3 _732 = select(_730, float3(0.0), isnan(_730));
    float _260 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _732.xy, uint(rint(_732.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _732.xy, uint(rint(_732.z))).w;
    float _262 = fma(_252, _256, _145);
    float _264 = fma(_248, _256, _180);
    float3 _749 = float3(_262, _264, float(int(_188)));
    float3 _751 = select(_749, float3(0.0), isnan(_749));
    float _266 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _751.xy, uint(rint(_751.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _751.xy, uint(rint(_751.z))).w;
    float _268 = in.m_39.w;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = -_109;
    float _276 = _274 + 1.0;
    float _278 = -_117;
    float _280 = _278 + 1.0;
    float _282 = abs(_127);
    float _284 = _282 * _190;
    float _286 = precise::min(_109, _117);
    float _288 = precise::min(_276, _280);
    float _290 = fma(_288, _192, _284);
    float _292 = fma(_286, _194, _290);
    float _294 = _87 * _272;
    float _296 = fma(_292, 0.25, _294);
    float _298 = fma(_296, 0.449999988079071044921875, -0.5625);
    float _300 = abs(_127);
    float _302 = _300 * _258;
    float _304 = fma(_288, _260, _302);
    float _306 = fma(_286, _266, _304);
    float _308 = _306 + _298;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    bool _314 = _310 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _316 = isnan(_310);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _322 = _318 || _320;
    if (!_322)
    {
        discard_fragment();
    }
    if (!_322)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return out;
    }
    float _324 = _294 * 1.0499999523162841796875;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _326 * 256.0;
    float _330 = trunc(_328);
    float _332 = precise::max(_330, 0.0);
    uint _334 = uint(_332);
    int _337 = -int(_334);
    int _339 = int(_334) << 8;
    int _341 = _339 + _337;
    uint _343 = uint(int(uint(_341) >> uint(8)));
    bool _345 = int(_343) != 255;
    bool _347 = !_345;
    if (!_347)
    {
        bool _349 = int(_343) != 0;
        if (!_349)
        {
            discard_fragment();
        }
        if (!_349)
        {
            out.m_42.x = 0.0;
            out.m_42.y = 0.0;
            out.m_42.z = 0.0;
            out.m_42.w = 0.0;
            return out;
        }
        float _351 = gl_FragCoord.x;
        float _353 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _355 = _351 / _353;
        float _357 = gl_FragCoord.y;
        float _359 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _361 = _357 / _359;
        float _363 = trunc(_355);
        float _365 = precise::max(_363, 0.0);
        uint _367 = uint(_365);
        float _369 = trunc(_361);
        float _371 = precise::max(_369, 0.0);
        uint _373 = uint(_371);
        int _375 = int(_367) + 2;
        uint _377 = uint(int(uint(_375) >> uint(1)));
        uint _379 = uint(int(uint(int(_373)) >> uint(1)));
        int _381 = int(_377) ^ int(_379);
        int _383 = _381 << 16;
        int _385 = _383 ^ int(_377);
        int _387 = 983055 & _385;
        int _389 = _387 << 6;
        int _391 = _389 + _387;
        int _393 = _391 & 13369548;
        uint _395 = uint(int(uint(_393) >> uint(3)));
        int _397 = _393 | int(_395);
        int _399 = _397 & 5570560;
        int _401 = _397 & 85;
        uint _403 = uint(int(uint(_399) >> uint(15)));
        int _405 = int(_403) + _401;
        bool _407 = _343 >= uint(_405);
        if (!_407)
        {
            discard_fragment();
        }
        if (!_407)
        {
            out.m_42.x = 0.0;
            out.m_42.y = 0.0;
            out.m_42.z = 0.0;
            out.m_42.w = 0.0;
            return out;
        }
    }
    out.m_42.x = 1.0;
    out.m_42.y = 1.0;
    out.m_42.z = 1.0;
    out.m_42.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _49;
    float _89 = _87 * _55;
    float _91 = _87 * _61;
    float _93 = _87 * _73;
    float _95 = in.m_33.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = floor(_89);
    float _103 = _87 * _79;
    float _105 = floor(_91);
    float _107 = -_101;
    float _109 = _89 + _107;
    float _111 = precise::max((*spvDescriptorSet0.fp_c11)._m0[40].x, 2.0);
    float _113 = _111 + (-1.0);
    float _115 = -_105;
    float _117 = _91 + _115;
    float _119 = in.m_35.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = -_117;
    float _127 = _109 + _125;
    float _129 = _87 * _99;
    float _131 = ceil(_127);
    float _133 = -_131;
    float _135 = _133 + 1.0;
    float _137 = _101 + _131;
    float _139 = _105 + _135;
    float _141 = precise::min(_113, _137);
    float _143 = precise::min(_113, _139);
    float _145 = _87 * _123;
    float _147 = fma(_111, _143, _141);
    float _149 = _101 + 1.0;
    float _151 = _105 + 1.0;
    float _153 = fma(_105, _111, _101);
    float _155 = _87 * _67;
    float _157 = rint(_147);
    float _159 = precise::max(_157, 0.0);
    uint _162 = uint(_159);
    uint _164 = clamp(_162, 0u, 65535u);
    float _166 = precise::min(_113, _149);
    float _168 = precise::min(_113, _151);
    float _170 = fma(_111, _168, _166);
    float _172 = rint(_153);
    float _174 = precise::max(_172, 0.0);
    uint _176 = uint(_174);
    uint _178 = clamp(_176, 0u, 65535u);
    float _180 = _87 * _85;
    float _182 = rint(_170);
    float _184 = precise::max(_182, 0.0);
    uint _186 = uint(_184);
    uint _188 = clamp(_186, 0u, 65535u);
    float3 _601 = float3(_155, _93, float(int(_164)));
    float3 _605 = select(_601, float3(0.0), isnan(_601));
    float _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _605.xy, uint(rint(_605.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _605.xy, uint(rint(_605.z))).w;
    float3 _614 = float3(_129, _103, float(int(_178)));
    float3 _616 = select(_614, float3(0.0), isnan(_614));
    float _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _616.xy, uint(rint(_616.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _616.xy, uint(rint(_616.z))).w;
    float3 _625 = float3(_145, _180, float(int(_188)));
    float3 _627 = select(_625, float3(0.0), isnan(_625));
    float _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _627.xy, uint(rint(_627.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _627.xy, uint(rint(_627.z))).w;
    float _196 = in.m_37.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_37.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_31.w;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_31.z;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_37.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_37.w;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = _87 * _200;
    float _234 = _87 * _206;
    float _236 = _190 + (-0.5);
    float _238 = fma(_232, _236, _93);
    float _240 = fma(_234, _236, _155);
    float _242 = _87 * _212;
    float _244 = _192 + (-0.5);
    float _246 = _87 * _218;
    float _248 = _87 * _230;
    float _250 = fma(_242, _244, _103);
    float _252 = _87 * _224;
    float _254 = fma(_246, _244, _129);
    float _256 = _194 + (-0.5);
    float3 _719 = float3(_240, _238, float(int(_164)));
    float3 _721 = select(_719, float3(0.0), isnan(_719));
    float _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _721.xy, uint(rint(_721.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _721.xy, uint(rint(_721.z))).w;
    float3 _730 = float3(_254, _250, float(int(_178)));
    float3 _732 = select(_730, float3(0.0), isnan(_730));
    float _260 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _732.xy, uint(rint(_732.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _732.xy, uint(rint(_732.z))).w;
    float _262 = fma(_252, _256, _145);
    float _264 = fma(_248, _256, _180);
    float3 _749 = float3(_262, _264, float(int(_188)));
    float3 _751 = select(_749, float3(0.0), isnan(_749));
    float _266 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _751.xy, uint(rint(_751.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _751.xy, uint(rint(_751.z))).w;
    float _268 = in.m_39.w;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = -_109;
    float _276 = _274 + 1.0;
    float _278 = -_117;
    float _280 = _278 + 1.0;
    float _282 = abs(_127);
    float _284 = _282 * _190;
    float _286 = precise::min(_109, _117);
    float _288 = precise::min(_276, _280);
    float _290 = fma(_288, _192, _284);
    float _292 = fma(_286, _194, _290);
    float _294 = _87 * _272;
    float _296 = fma(_292, 0.25, _294);
    float _298 = fma(_296, 0.449999988079071044921875, -0.5625);
    float _300 = abs(_127);
    float _302 = _300 * _258;
    float _304 = fma(_288, _260, _302);
    float _306 = fma(_286, _266, _304);
    float _308 = _306 + _298;
    float _310 = precise::clamp(_308, 0.0, 1.0);
    bool _314 = _310 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _316 = isnan(_310);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _322 = _318 || _320;
    if (!_322)
    {
        discard_fragment();
    }
    if (!_322)
    {
        out.m_42.x = 0.0;
        out.m_42.y = 0.0;
        out.m_42.z = 0.0;
        out.m_42.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    float _324 = _294 * 1.0499999523162841796875;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _326 * 256.0;
    float _330 = trunc(_328);
    float _332 = precise::max(_330, 0.0);
    uint _334 = uint(_332);
    int _337 = -int(_334);
    int _339 = int(_334) << 8;
    int _341 = _339 + _337;
    uint _343 = uint(int(uint(_341) >> uint(8)));
    bool _345 = int(_343) != 255;
    bool _347 = !_345;
    if (!_347)
    {
        bool _349 = int(_343) != 0;
        if (!_349)
        {
            discard_fragment();
        }
        if (!_349)
        {
            out.m_42.x = 0.0;
            out.m_42.y = 0.0;
            out.m_42.z = 0.0;
            out.m_42.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_42)};
        }
        float _351 = gl_FragCoord.x;
        float _353 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _355 = _351 / _353;
        float _357 = gl_FragCoord.y;
        float _359 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _361 = _357 / _359;
        float _363 = trunc(_355);
        float _365 = precise::max(_363, 0.0);
        uint _367 = uint(_365);
        float _369 = trunc(_361);
        float _371 = precise::max(_369, 0.0);
        uint _373 = uint(_371);
        int _375 = int(_367) + 2;
        uint _377 = uint(int(uint(_375) >> uint(1)));
        uint _379 = uint(int(uint(int(_373)) >> uint(1)));
        int _381 = int(_377) ^ int(_379);
        int _383 = _381 << 16;
        int _385 = _383 ^ int(_377);
        int _387 = 983055 & _385;
        int _389 = _387 << 6;
        int _391 = _389 + _387;
        int _393 = _391 & 13369548;
        uint _395 = uint(int(uint(_393) >> uint(3)));
        int _397 = _393 | int(_395);
        int _399 = _397 & 5570560;
        int _401 = _397 & 85;
        uint _403 = uint(int(uint(_399) >> uint(15)));
        int _405 = int(_403) + _401;
        bool _407 = _343 >= uint(_405);
        if (!_407)
        {
            discard_fragment();
        }
        if (!_407)
        {
            out.m_42.x = 0.0;
            out.m_42.y = 0.0;
            out.m_42.z = 0.0;
            out.m_42.w = 0.0;
            return main0_out_u{as_type<uint4>(out.m_42)};
        }
    }
    out.m_42.x = 1.0;
    out.m_42.y = 1.0;
    out.m_42.z = 1.0;
    out.m_42.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

