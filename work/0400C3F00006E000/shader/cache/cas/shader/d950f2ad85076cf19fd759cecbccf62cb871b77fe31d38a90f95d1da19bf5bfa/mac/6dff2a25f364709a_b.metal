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
    constant _16* vp_c4 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
    texture2d<float> vp_t_tcb_8 [[id(2)]];
    sampler vp_t_tcb_8Smplr [[id(3)]];
    sampler vp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_40 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_32 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_36 [[user(locn5)]];
    float4 m_38 [[user(locn6)]];
    float4 m_34 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_29 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_29.y;
    float _62 = in.m_29.z;
    float _64 = in.m_29.x;
    bool _68 = _60 >= 0.100000001490116119384765625;
    bool _70 = isnan(_60);
    bool _72 = _68 || _70;
    bool _74 = isnan(0.100000001490116119384765625);
    bool _76 = _72 || _74;
    float _78 = _60 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _80 = _60 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _82 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[32].x, _78);
    float _84 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[33].x, _80);
    float _86 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[32].z, _82);
    float _88 = 0.0;
    if (_76)
    {
        _88 = _60;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_76)
    {
        float _94 = _60 + (-0.007000000216066837310791015625);
        _92 = _94;
    }
    float _96 = _92;
    float _98 = 0.0;
    if (_76)
    {
        _98 = _62;
    }
    float _100 = _98;
    float _102 = _60 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _104 = _100;
    if (!_76)
    {
        float _106 = _62 * 1.0499999523162841796875;
        _104 = _106;
    }
    float _108 = _104;
    float _110 = 0.0;
    if (_76)
    {
        _110 = _64;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_76)
    {
        float _116 = _64 * 1.0499999523162841796875;
        _114 = _116;
    }
    float _118 = _114;
    float _120 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[34].x, _102);
    float _122 = _108 * _108;
    float _124 = _96 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _126 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[33].z, _84);
    float _128 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[34].z, _120);
    float _130 = fma(_118, _118, _122);
    float _132 = _96 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _134 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[5].x, _124);
    float _136 = _96 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _138 = _96 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _140 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[4].x, _132);
    float _142 = sqrt(_130);
    float _144 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[5].z, _134);
    float _146 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[6].x, _136);
    float _148 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[4].z, _140);
    float _150 = _126 * _126;
    float _152 = _144 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _154 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[7].x, _138);
    float _156 = _148 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _158 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[6].z, _146);
    float _160 = _152 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _162 = fma(_86, _86, _150);
    float _164 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[7].z, _154);
    float _166 = _158 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[11].x, _160);
    float _170 = fma(_128, _128, _162);
    float _172 = _164 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    bool _174 = _142 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _176 = isnan(_142);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _182 = _178 || _180;
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[11].z, _168);
    float _186 = rsqrt(_170);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[11].w, _184);
    float _190 = _146;
    float _192 = _142;
    if (_182)
    {
        _190 = _188;
    }
    float _194 = _190;
    float _196 = _194;
    if (!_182)
    {
        _196 = 0.0;
    }
    float _198 = _196;
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[40].x, _200);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _86 * _186;
    float _208 = _126 * _186;
    float _210 = _128 * _186;
    float _212 = -_204;
    float _214 = _212 + 1.0;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _218 = -_208;
    float _220 = -_216;
    float _222 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[42].y, _220);
    float _224 = abs(_214);
    float _226 = log2(_224);
    float _228 = -_210;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c4)._m0[42].z, _222);
    float _232 = fma(_230, -0.5, 0.5);
    float _234 = fma(_230, 0.5, 0.5);
    float _236 = fma(_234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _238 = sqrt(_232);
    float _240 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _242 = fma(_234, _236, -0.212114393711090087890625);
    float _244 = fma(_234, _242, 1.570728778839111328125);
    float _246 = exp2(_240);
    float _248 = _238 * 0.636619746685028076171875;
    float _250 = -_244;
    float _252 = fma(_248, _250, 1.0);
    float _254 = fma(_246, 0.5, 0.5);
    float2 _775 = float2(_252, _254);
    float3 _258 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_775, float2(0.0), isnan(_775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_775, float2(0.0), isnan(_775)), level(0.0)).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    bool _266 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _268 = isnan(0.0);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _274 = _270 || _272;
    float _276 = _118 + (-0.5);
    float _278 = _108 + (-0.5);
    float _280 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _282 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _284 = fma(2.0, _282, 0.5);
    float _286 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _288 = fma(2.0, _286, 0.5);
    float _290 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _292 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _294 = _278 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _296 = exp2(_280);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c4)._m0[5].w, _290);
    float _300 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[5].w, _292);
    float _302 = _276 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _306 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    out.m_32.x = 0.0;
    float _308 = _302 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _310 = _276;
    int _313 = as_type<int>(_298);
    if (_274)
    {
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _310 = _315;
    }
    float _317 = _310;
    float _319 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _321 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _323 = fma(_304, 10.0, _321);
    float _325 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _327 = fma(_308, 10.0, _325);
    float _329 = _306 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _331 = _319 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _333 = _323 * 0.15915493667125701904296875;
    float _335 = _327 * 0.15915493667125701904296875;
    float _337 = _152 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    out.m_34.x = _208;
    float _339 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[8].x, _337);
    float _341 = _335 * 6.283185482025146484375;
    float _343 = sin(_341);
    out.m_36.x = _298;
    out.m_36.y = _300;
    out.m_36.z = _331;
    out.m_36.w = _329;
    float _345 = _323;
    if (_274)
    {
        float _347 = _142 * _317;
        float _349 = precise::clamp(_347, 0.0, 1.0);
        _192 = _349;
    }
    float _351 = _192;
    float _353 = _152 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _355 = _152 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    out.m_38.x = _198;
    if (_274)
    {
        float _357 = -_351;
        float _359 = _357 + 1.0;
        _345 = _359;
    }
    float _361 = _345;
    float _363 = _333 * 6.283185482025146484375;
    float _365 = sin(_363);
    float _367 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[9].x, _353);
    float _369 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[10].x, _355);
    float _371 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[8].z, _339);
    out.m_40.w = _198;
    if (_274)
    {
        float _373 = _361 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _313 = as_type<int>(_373);
    }
    int _375 = _313;
    float _377 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[9].z, _367);
    float _379 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[10].z, _369);
    float _381 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[8].w, _371);
    float _383 = _198 * 0.5;
    float _385 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[10].w, _379);
    float _387 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[9].w, _377);
    float _389 = _381 + _198;
    float _391 = -_296;
    float _393 = fma(_391, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _395 = precise::clamp(_393, 0.0, 1.0);
    if (_274)
    {
        out.m_32.x = as_type<float>(_375);
    }
    float _397 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _399 = fma(_397, (*spvDescriptorSet0.vp_c4)._m0[45].y, _385);
    float _401 = fma(_343, 0.0350000001490116119384765625, _308);
    float _403 = fma(_365, -0.01750000007450580596923828125, _304);
    float _405 = fma(_387, -0.5, _383);
    float _407 = _395 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    out.gl_Position.x = _381;
    out.gl_Position.y = _387;
    out.gl_Position.z = _399;
    out.gl_Position.w = _188;
    float _409 = _389 * 0.5;
    out.m_42.x = _401;
    out.m_42.y = _403;
    out.m_40.x = _409;
    out.m_40.y = _405;
    out.m_44.x = _407;
    if (!_182)
    {
        out.gl_Position.w = 0.0;
    }
    float _411 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _413 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _415 = _264 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_46.x = _411;
    out.m_46.y = _413;
    out.m_46.z = _415;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_29.y;
    float _62 = in.m_29.z;
    float _64 = in.m_29.x;
    bool _68 = _60 >= 0.100000001490116119384765625;
    bool _70 = isnan(_60);
    bool _72 = _68 || _70;
    bool _74 = isnan(0.100000001490116119384765625);
    bool _76 = _72 || _74;
    float _78 = _60 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _80 = _60 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _82 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[32].x, _78);
    float _84 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[33].x, _80);
    float _86 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[32].z, _82);
    float _88 = 0.0;
    if (_76)
    {
        _88 = _60;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_76)
    {
        float _94 = _60 + (-0.007000000216066837310791015625);
        _92 = _94;
    }
    float _96 = _92;
    float _98 = 0.0;
    if (_76)
    {
        _98 = _62;
    }
    float _100 = _98;
    float _102 = _60 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _104 = _100;
    if (!_76)
    {
        float _106 = _62 * 1.0499999523162841796875;
        _104 = _106;
    }
    float _108 = _104;
    float _110 = 0.0;
    if (_76)
    {
        _110 = _64;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_76)
    {
        float _116 = _64 * 1.0499999523162841796875;
        _114 = _116;
    }
    float _118 = _114;
    float _120 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[34].x, _102);
    float _122 = _108 * _108;
    float _124 = _96 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _126 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[33].z, _84);
    float _128 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[34].z, _120);
    float _130 = fma(_118, _118, _122);
    float _132 = _96 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _134 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[5].x, _124);
    float _136 = _96 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _138 = _96 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _140 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[4].x, _132);
    float _142 = sqrt(_130);
    float _144 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[5].z, _134);
    float _146 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[6].x, _136);
    float _148 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[4].z, _140);
    float _150 = _126 * _126;
    float _152 = _144 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _154 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[7].x, _138);
    float _156 = _148 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _158 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[6].z, _146);
    float _160 = _152 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _162 = fma(_86, _86, _150);
    float _164 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[7].z, _154);
    float _166 = _158 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[11].x, _160);
    float _170 = fma(_128, _128, _162);
    float _172 = _164 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    bool _174 = _142 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _176 = isnan(_142);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _182 = _178 || _180;
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[11].z, _168);
    float _186 = rsqrt(_170);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[11].w, _184);
    float _190 = _146;
    float _192 = _142;
    if (_182)
    {
        _190 = _188;
    }
    float _194 = _190;
    float _196 = _194;
    if (!_182)
    {
        _196 = 0.0;
    }
    float _198 = _196;
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[40].x, _200);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _86 * _186;
    float _208 = _126 * _186;
    float _210 = _128 * _186;
    float _212 = -_204;
    float _214 = _212 + 1.0;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _218 = -_208;
    float _220 = -_216;
    float _222 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[42].y, _220);
    float _224 = abs(_214);
    float _226 = log2(_224);
    float _228 = -_210;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c4)._m0[42].z, _222);
    float _232 = fma(_230, -0.5, 0.5);
    float _234 = fma(_230, 0.5, 0.5);
    float _236 = fma(_234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _238 = sqrt(_232);
    float _240 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _242 = fma(_234, _236, -0.212114393711090087890625);
    float _244 = fma(_234, _242, 1.570728778839111328125);
    float _246 = exp2(_240);
    float _248 = _238 * 0.636619746685028076171875;
    float _250 = -_244;
    float _252 = fma(_248, _250, 1.0);
    float _254 = fma(_246, 0.5, 0.5);
    float2 _775 = float2(_252, _254);
    float3 _258 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_775, float2(0.0), isnan(_775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_775, float2(0.0), isnan(_775)), level(0.0)).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    bool _266 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _268 = isnan(0.0);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _274 = _270 || _272;
    float _276 = _118 + (-0.5);
    float _278 = _108 + (-0.5);
    float _280 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _282 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _284 = fma(2.0, _282, 0.5);
    float _286 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _288 = fma(2.0, _286, 0.5);
    float _290 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _292 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _294 = _278 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _296 = exp2(_280);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c4)._m0[5].w, _290);
    float _300 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[5].w, _292);
    float _302 = _276 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _306 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    out.m_32.x = 0.0;
    float _308 = _302 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _310 = _276;
    int _313 = as_type<int>(_298);
    if (_274)
    {
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _310 = _315;
    }
    float _317 = _310;
    float _319 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _321 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _323 = fma(_304, 10.0, _321);
    float _325 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _327 = fma(_308, 10.0, _325);
    float _329 = _306 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _331 = _319 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _333 = _323 * 0.15915493667125701904296875;
    float _335 = _327 * 0.15915493667125701904296875;
    float _337 = _152 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    out.m_34.x = _208;
    float _339 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[8].x, _337);
    float _341 = _335 * 6.283185482025146484375;
    float _343 = sin(_341);
    out.m_36.x = _298;
    out.m_36.y = _300;
    out.m_36.z = _331;
    out.m_36.w = _329;
    float _345 = _323;
    if (_274)
    {
        float _347 = _142 * _317;
        float _349 = precise::clamp(_347, 0.0, 1.0);
        _192 = _349;
    }
    float _351 = _192;
    float _353 = _152 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _355 = _152 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    out.m_38.x = _198;
    if (_274)
    {
        float _357 = -_351;
        float _359 = _357 + 1.0;
        _345 = _359;
    }
    float _361 = _345;
    float _363 = _333 * 6.283185482025146484375;
    float _365 = sin(_363);
    float _367 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[9].x, _353);
    float _369 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[10].x, _355);
    float _371 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[8].z, _339);
    out.m_40.w = _198;
    if (_274)
    {
        float _373 = _361 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _313 = as_type<int>(_373);
    }
    int _375 = _313;
    float _377 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[9].z, _367);
    float _379 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[10].z, _369);
    float _381 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[8].w, _371);
    float _383 = _198 * 0.5;
    float _385 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[10].w, _379);
    float _387 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[9].w, _377);
    float _389 = _381 + _198;
    float _391 = -_296;
    float _393 = fma(_391, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _395 = precise::clamp(_393, 0.0, 1.0);
    if (_274)
    {
        out.m_32.x = as_type<float>(_375);
    }
    float _397 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _399 = fma(_397, (*spvDescriptorSet0.vp_c4)._m0[45].y, _385);
    float _401 = fma(_343, 0.0350000001490116119384765625, _308);
    float _403 = fma(_365, -0.01750000007450580596923828125, _304);
    float _405 = fma(_387, -0.5, _383);
    float _407 = _395 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    out.gl_Position.x = _381;
    out.gl_Position.y = _387;
    out.gl_Position.z = _399;
    out.gl_Position.w = _188;
    float _409 = _389 * 0.5;
    out.m_42.x = _401;
    out.m_42.y = _403;
    out.m_40.x = _409;
    out.m_40.y = _405;
    out.m_44.x = _407;
    if (!_182)
    {
        out.gl_Position.w = 0.0;
    }
    float _411 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _413 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _415 = _264 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_46.x = _411;
    out.m_46.y = _413;
    out.m_46.z = _415;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = in.m_29.y;
    float _62 = in.m_29.z;
    float _64 = in.m_29.x;
    bool _68 = _60 >= 0.100000001490116119384765625;
    bool _70 = isnan(_60);
    bool _72 = _68 || _70;
    bool _74 = isnan(0.100000001490116119384765625);
    bool _76 = _72 || _74;
    float _78 = _60 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _80 = _60 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _82 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[32].x, _78);
    float _84 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[33].x, _80);
    float _86 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[32].z, _82);
    float _88 = 0.0;
    if (_76)
    {
        _88 = _60;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_76)
    {
        float _94 = _60 + (-0.007000000216066837310791015625);
        _92 = _94;
    }
    float _96 = _92;
    float _98 = 0.0;
    if (_76)
    {
        _98 = _62;
    }
    float _100 = _98;
    float _102 = _60 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _104 = _100;
    if (!_76)
    {
        float _106 = _62 * 1.0499999523162841796875;
        _104 = _106;
    }
    float _108 = _104;
    float _110 = 0.0;
    if (_76)
    {
        _110 = _64;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_76)
    {
        float _116 = _64 * 1.0499999523162841796875;
        _114 = _116;
    }
    float _118 = _114;
    float _120 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[34].x, _102);
    float _122 = _108 * _108;
    float _124 = _96 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _126 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[33].z, _84);
    float _128 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[34].z, _120);
    float _130 = fma(_118, _118, _122);
    float _132 = _96 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _134 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[5].x, _124);
    float _136 = _96 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _138 = _96 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _140 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[4].x, _132);
    float _142 = sqrt(_130);
    float _144 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[5].z, _134);
    float _146 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[6].x, _136);
    float _148 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[4].z, _140);
    float _150 = _126 * _126;
    float _152 = _144 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _154 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[7].x, _138);
    float _156 = _148 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _158 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[6].z, _146);
    float _160 = _152 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _162 = fma(_86, _86, _150);
    float _164 = fma(_108, (*spvDescriptorSet0.vp_c3)._m0[7].z, _154);
    float _166 = _158 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _168 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[11].x, _160);
    float _170 = fma(_128, _128, _162);
    float _172 = _164 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    bool _174 = _142 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _176 = isnan(_142);
    bool _178 = _174 || _176;
    bool _180 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _182 = _178 || _180;
    float _184 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[11].z, _168);
    float _186 = rsqrt(_170);
    float _188 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[11].w, _184);
    float _190 = _146;
    float _192 = _142;
    if (_182)
    {
        _190 = _188;
    }
    float _194 = _190;
    float _196 = _194;
    if (!_182)
    {
        _196 = 0.0;
    }
    float _198 = _196;
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[40].x, _200);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _86 * _186;
    float _208 = _126 * _186;
    float _210 = _128 * _186;
    float _212 = -_204;
    float _214 = _212 + 1.0;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _218 = -_208;
    float _220 = -_216;
    float _222 = fma(_218, (*spvDescriptorSet0.vp_c4)._m0[42].y, _220);
    float _224 = abs(_214);
    float _226 = log2(_224);
    float _228 = -_210;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c4)._m0[42].z, _222);
    float _232 = fma(_230, -0.5, 0.5);
    float _234 = fma(_230, 0.5, 0.5);
    float _236 = fma(_234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _238 = sqrt(_232);
    float _240 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _242 = fma(_234, _236, -0.212114393711090087890625);
    float _244 = fma(_234, _242, 1.570728778839111328125);
    float _246 = exp2(_240);
    float _248 = _238 * 0.636619746685028076171875;
    float _250 = -_244;
    float _252 = fma(_248, _250, 1.0);
    float _254 = fma(_246, 0.5, 0.5);
    float2 _775 = float2(_252, _254);
    float3 _258 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_775, float2(0.0), isnan(_775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_775, float2(0.0), isnan(_775)), level(0.0)).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    bool _266 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _268 = isnan(0.0);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _274 = _270 || _272;
    float _276 = _118 + (-0.5);
    float _278 = _108 + (-0.5);
    float _280 = _226 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _282 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _284 = fma(2.0, _282, 0.5);
    float _286 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _288 = fma(2.0, _286, 0.5);
    float _290 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _292 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _294 = _278 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _296 = exp2(_280);
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c4)._m0[5].w, _290);
    float _300 = fma(_288, (*spvDescriptorSet0.vp_c4)._m0[5].w, _292);
    float _302 = _276 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _304 = _294 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _306 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    out.m_32.x = 0.0;
    float _308 = _302 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _310 = _276;
    int _313 = as_type<int>(_298);
    if (_274)
    {
        float _315 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _310 = _315;
    }
    float _317 = _310;
    float _319 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _321 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _323 = fma(_304, 10.0, _321);
    float _325 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _327 = fma(_308, 10.0, _325);
    float _329 = _306 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _331 = _319 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _333 = _323 * 0.15915493667125701904296875;
    float _335 = _327 * 0.15915493667125701904296875;
    float _337 = _152 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    out.m_34.x = _208;
    float _339 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[8].x, _337);
    float _341 = _335 * 6.283185482025146484375;
    float _343 = sin(_341);
    out.m_36.x = _298;
    out.m_36.y = _300;
    out.m_36.z = _331;
    out.m_36.w = _329;
    float _345 = _323;
    if (_274)
    {
        float _347 = _142 * _317;
        float _349 = precise::clamp(_347, 0.0, 1.0);
        _192 = _349;
    }
    float _351 = _192;
    float _353 = _152 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _355 = _152 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    out.m_38.x = _198;
    if (_274)
    {
        float _357 = -_351;
        float _359 = _357 + 1.0;
        _345 = _359;
    }
    float _361 = _345;
    float _363 = _333 * 6.283185482025146484375;
    float _365 = sin(_363);
    float _367 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[9].x, _353);
    float _369 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[10].x, _355);
    float _371 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[8].z, _339);
    out.m_40.w = _198;
    if (_274)
    {
        float _373 = _361 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _313 = as_type<int>(_373);
    }
    int _375 = _313;
    float _377 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[9].z, _367);
    float _379 = fma(_166, (*spvDescriptorSet0.vp_c3)._m0[10].z, _369);
    float _381 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[8].w, _371);
    float _383 = _198 * 0.5;
    float _385 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[10].w, _379);
    float _387 = fma(_172, (*spvDescriptorSet0.vp_c3)._m0[9].w, _377);
    float _389 = _381 + _198;
    float _391 = -_296;
    float _393 = fma(_391, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _395 = precise::clamp(_393, 0.0, 1.0);
    if (_274)
    {
        out.m_32.x = as_type<float>(_375);
    }
    float _397 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _399 = fma(_397, (*spvDescriptorSet0.vp_c4)._m0[45].y, _385);
    float _401 = fma(_343, 0.0350000001490116119384765625, _308);
    float _403 = fma(_365, -0.01750000007450580596923828125, _304);
    float _405 = fma(_387, -0.5, _383);
    float _407 = _395 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    out.gl_Position.x = _381;
    out.gl_Position.y = _387;
    out.gl_Position.z = _399;
    out.gl_Position.w = _188;
    float _409 = _389 * 0.5;
    out.m_42.x = _401;
    out.m_42.y = _403;
    out.m_40.x = _409;
    out.m_40.y = _405;
    out.m_44.x = _407;
    if (!_182)
    {
        out.gl_Position.w = 0.0;
    }
    float _411 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _413 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _415 = _264 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_46.x = _411;
    out.m_46.y = _413;
    out.m_46.z = _415;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

