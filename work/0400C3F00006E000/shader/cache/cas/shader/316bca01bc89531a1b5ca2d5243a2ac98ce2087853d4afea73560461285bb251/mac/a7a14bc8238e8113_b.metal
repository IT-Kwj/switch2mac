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
    float4 m_42 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_32 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_36 [[user(locn6)]];
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_29.y;
    float _60 = in.m_29.z;
    float _62 = in.m_29.x;
    bool _66 = _58 >= 0.100000001490116119384765625;
    bool _68 = isnan(_58);
    bool _70 = _66 || _68;
    bool _72 = isnan(0.100000001490116119384765625);
    bool _74 = _70 || _72;
    float _76 = _58 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _78 = _58 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _80 = _58 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _82 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[32].x, _76);
    float _84 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[34].x, _80);
    float _86 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[32].z, _82);
    float _88 = 0.0;
    if (_74)
    {
        _88 = _60;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_74)
    {
        float _94 = _60 * 1.0499999523162841796875;
        _92 = _94;
    }
    float _96 = _92;
    float _98 = 0.0;
    if (_74)
    {
        _98 = _58;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_74)
    {
        float _104 = _58 + (-0.007000000216066837310791015625);
        _102 = _104;
    }
    float _106 = _102;
    float _108 = 0.0;
    if (_74)
    {
        _108 = _62;
    }
    float _110 = _108;
    float _112 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[33].x, _78);
    float _114 = _110;
    if (!_74)
    {
        float _116 = _62 * 1.0499999523162841796875;
        _114 = _116;
    }
    float _118 = _114;
    float _120 = _96 * _96;
    float _122 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[34].z, _84);
    float _124 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[33].z, _112);
    float _126 = _106 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _128 = fma(_118, _118, _120);
    float _130 = _106 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _132 = _106 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _134 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[5].x, _126);
    float _136 = _106 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _138 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[4].x, _130);
    float _140 = sqrt(_128);
    float _142 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[5].z, _134);
    float _144 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[6].x, _132);
    float _146 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[4].z, _138);
    float _148 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[7].x, _136);
    float _150 = _142 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _152 = _124 * _124;
    float _154 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[6].z, _144);
    float _156 = _146 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _158 = _150 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _160 = fma(_86, _86, _152);
    float _162 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[7].z, _148);
    float _164 = _154 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _166 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[11].x, _158);
    float _168 = fma(_122, _122, _160);
    float _170 = _162 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    bool _172 = _140 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _174 = isnan(_140);
    bool _176 = _172 || _174;
    bool _178 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _180 = _176 || _178;
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[11].z, _166);
    float _184 = rsqrt(_168);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[11].w, _182);
    float _188 = _160;
    float _190 = _140;
    if (_180)
    {
        _188 = _186;
    }
    float _192 = _188;
    float _194 = _192;
    if (!_180)
    {
        _194 = 0.0;
    }
    float _196 = _194;
    float _198 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _200 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[40].x, _198);
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = _86 * _184;
    float _206 = _124 * _184;
    float _208 = _122 * _184;
    float _210 = -_202;
    float _212 = _210 + 1.0;
    float _214 = _204 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _216 = abs(_212);
    float _218 = log2(_216);
    float _220 = -_206;
    float _222 = -_214;
    float _224 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[42].y, _222);
    float _226 = -_208;
    float _228 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[42].z, _224);
    float _230 = fma(_228, -0.5, 0.5);
    float _232 = fma(_228, 0.5, 0.5);
    float _234 = fma(_232, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _236 = sqrt(_230);
    float _238 = _218 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _240 = fma(_232, _234, -0.212114393711090087890625);
    float _242 = fma(_232, _240, 1.570728778839111328125);
    float _244 = exp2(_238);
    float _246 = _236 * 0.636619746685028076171875;
    float _248 = -_242;
    float _250 = fma(_246, _248, 1.0);
    float _252 = fma(_244, 0.5, 0.5);
    float2 _765 = float2(_250, _252);
    float3 _256 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_765, float2(0.0), isnan(_765)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_765, float2(0.0), isnan(_765)), level(0.0)).xyz;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = _118 + (-0.5);
    float _266 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    bool _268 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _270 = isnan(0.0);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _276 = _272 || _274;
    float _278 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _280 = fma(2.0, _278, 0.5);
    float _282 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _284 = fma(2.0, _282, 0.5);
    float _286 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _288 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _290 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _292 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[5].w, _286);
    float _294 = _96 + (-0.5);
    float _296 = _264 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c4)._m0[5].w, _288);
    float _300 = _218 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _302 = _294 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _306 = 0.0;
    if (_276)
    {
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _306 = _308;
    }
    float _310 = _306;
    float _312 = _290 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _314 = _302 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _316 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _318 = fma(_304, 10.0, _316);
    float _320 = _266 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _322 = _150 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _324 = _318 * 0.15915493667125701904296875;
    float _326 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _328 = fma(_314, 10.0, _326);
    float _330 = exp2(_300);
    out.m_32.x = _292;
    out.m_32.y = _298;
    out.m_32.z = _312;
    out.m_32.w = _320;
    float _332 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[8].x, _322);
    float _334 = _328 * 0.15915493667125701904296875;
    out.m_34.x = 0.0;
    float _336 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[8].z, _332);
    if (_276)
    {
        float _338 = _140 * _310;
        float _340 = precise::clamp(_338, 0.0, 1.0);
        _190 = _340;
    }
    float _342 = _190;
    float _344 = _324 * 6.283185482025146484375;
    float _346 = sin(_344);
    out.m_36.x = _206;
    float _348 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[8].w, _336);
    float _350 = _342;
    if (_276)
    {
        float _352 = -_342;
        float _354 = _352 + 1.0;
        _350 = _354;
    }
    float _356 = _350;
    out.m_38.x = _196;
    float _358 = _150 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _360 = _150 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _362 = _334 * 6.283185482025146484375;
    float _364 = sin(_362);
    float _366 = -_330;
    float _368 = fma(_366, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[9].x, _358);
    float _374 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[10].x, _360);
    int _377 = as_type<int>(_356);
    if (_276)
    {
        float _379 = _356 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _377 = as_type<int>(_379);
    }
    int _381 = _377;
    float _383 = _370 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    float _385 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[9].z, _372);
    float _387 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[10].z, _374);
    float _389 = fma(_346, 0.0350000001490116119384765625, _304);
    float _391 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[9].w, _385);
    float _393 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[10].w, _387);
    if (_276)
    {
        out.m_34.x = as_type<float>(_381);
    }
    float _395 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _397 = fma(_395, (*spvDescriptorSet0.vp_c4)._m0[45].y, _393);
    float _399 = fma(_364, -0.01750000007450580596923828125, _314);
    out.m_40.x = _383;
    out.gl_Position.x = _348;
    out.gl_Position.y = _391;
    out.gl_Position.z = _397;
    out.gl_Position.w = _186;
    out.m_42.x = _389;
    out.m_42.y = _399;
    if (!_180)
    {
        out.gl_Position.w = 0.0;
    }
    float _401 = _258 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _403 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _405 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_44.x = _401;
    out.m_44.y = _403;
    out.m_44.z = _405;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_29.y;
    float _60 = in.m_29.z;
    float _62 = in.m_29.x;
    bool _66 = _58 >= 0.100000001490116119384765625;
    bool _68 = isnan(_58);
    bool _70 = _66 || _68;
    bool _72 = isnan(0.100000001490116119384765625);
    bool _74 = _70 || _72;
    float _76 = _58 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _78 = _58 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _80 = _58 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _82 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[32].x, _76);
    float _84 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[34].x, _80);
    float _86 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[32].z, _82);
    float _88 = 0.0;
    if (_74)
    {
        _88 = _60;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_74)
    {
        float _94 = _60 * 1.0499999523162841796875;
        _92 = _94;
    }
    float _96 = _92;
    float _98 = 0.0;
    if (_74)
    {
        _98 = _58;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_74)
    {
        float _104 = _58 + (-0.007000000216066837310791015625);
        _102 = _104;
    }
    float _106 = _102;
    float _108 = 0.0;
    if (_74)
    {
        _108 = _62;
    }
    float _110 = _108;
    float _112 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[33].x, _78);
    float _114 = _110;
    if (!_74)
    {
        float _116 = _62 * 1.0499999523162841796875;
        _114 = _116;
    }
    float _118 = _114;
    float _120 = _96 * _96;
    float _122 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[34].z, _84);
    float _124 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[33].z, _112);
    float _126 = _106 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _128 = fma(_118, _118, _120);
    float _130 = _106 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _132 = _106 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _134 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[5].x, _126);
    float _136 = _106 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _138 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[4].x, _130);
    float _140 = sqrt(_128);
    float _142 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[5].z, _134);
    float _144 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[6].x, _132);
    float _146 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[4].z, _138);
    float _148 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[7].x, _136);
    float _150 = _142 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _152 = _124 * _124;
    float _154 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[6].z, _144);
    float _156 = _146 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _158 = _150 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _160 = fma(_86, _86, _152);
    float _162 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[7].z, _148);
    float _164 = _154 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _166 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[11].x, _158);
    float _168 = fma(_122, _122, _160);
    float _170 = _162 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    bool _172 = _140 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _174 = isnan(_140);
    bool _176 = _172 || _174;
    bool _178 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _180 = _176 || _178;
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[11].z, _166);
    float _184 = rsqrt(_168);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[11].w, _182);
    float _188 = _160;
    float _190 = _140;
    if (_180)
    {
        _188 = _186;
    }
    float _192 = _188;
    float _194 = _192;
    if (!_180)
    {
        _194 = 0.0;
    }
    float _196 = _194;
    float _198 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _200 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[40].x, _198);
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = _86 * _184;
    float _206 = _124 * _184;
    float _208 = _122 * _184;
    float _210 = -_202;
    float _212 = _210 + 1.0;
    float _214 = _204 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _216 = abs(_212);
    float _218 = log2(_216);
    float _220 = -_206;
    float _222 = -_214;
    float _224 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[42].y, _222);
    float _226 = -_208;
    float _228 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[42].z, _224);
    float _230 = fma(_228, -0.5, 0.5);
    float _232 = fma(_228, 0.5, 0.5);
    float _234 = fma(_232, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _236 = sqrt(_230);
    float _238 = _218 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _240 = fma(_232, _234, -0.212114393711090087890625);
    float _242 = fma(_232, _240, 1.570728778839111328125);
    float _244 = exp2(_238);
    float _246 = _236 * 0.636619746685028076171875;
    float _248 = -_242;
    float _250 = fma(_246, _248, 1.0);
    float _252 = fma(_244, 0.5, 0.5);
    float2 _765 = float2(_250, _252);
    float3 _256 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_765, float2(0.0), isnan(_765)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_765, float2(0.0), isnan(_765)), level(0.0)).xyz;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = _118 + (-0.5);
    float _266 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    bool _268 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _270 = isnan(0.0);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _276 = _272 || _274;
    float _278 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _280 = fma(2.0, _278, 0.5);
    float _282 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _284 = fma(2.0, _282, 0.5);
    float _286 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _288 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _290 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _292 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[5].w, _286);
    float _294 = _96 + (-0.5);
    float _296 = _264 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c4)._m0[5].w, _288);
    float _300 = _218 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _302 = _294 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _306 = 0.0;
    if (_276)
    {
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _306 = _308;
    }
    float _310 = _306;
    float _312 = _290 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _314 = _302 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _316 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _318 = fma(_304, 10.0, _316);
    float _320 = _266 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _322 = _150 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _324 = _318 * 0.15915493667125701904296875;
    float _326 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _328 = fma(_314, 10.0, _326);
    float _330 = exp2(_300);
    out.m_32.x = _292;
    out.m_32.y = _298;
    out.m_32.z = _312;
    out.m_32.w = _320;
    float _332 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[8].x, _322);
    float _334 = _328 * 0.15915493667125701904296875;
    out.m_34.x = 0.0;
    float _336 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[8].z, _332);
    if (_276)
    {
        float _338 = _140 * _310;
        float _340 = precise::clamp(_338, 0.0, 1.0);
        _190 = _340;
    }
    float _342 = _190;
    float _344 = _324 * 6.283185482025146484375;
    float _346 = sin(_344);
    out.m_36.x = _206;
    float _348 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[8].w, _336);
    float _350 = _342;
    if (_276)
    {
        float _352 = -_342;
        float _354 = _352 + 1.0;
        _350 = _354;
    }
    float _356 = _350;
    out.m_38.x = _196;
    float _358 = _150 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _360 = _150 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _362 = _334 * 6.283185482025146484375;
    float _364 = sin(_362);
    float _366 = -_330;
    float _368 = fma(_366, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[9].x, _358);
    float _374 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[10].x, _360);
    int _377 = as_type<int>(_356);
    if (_276)
    {
        float _379 = _356 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _377 = as_type<int>(_379);
    }
    int _381 = _377;
    float _383 = _370 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    float _385 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[9].z, _372);
    float _387 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[10].z, _374);
    float _389 = fma(_346, 0.0350000001490116119384765625, _304);
    float _391 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[9].w, _385);
    float _393 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[10].w, _387);
    if (_276)
    {
        out.m_34.x = as_type<float>(_381);
    }
    float _395 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _397 = fma(_395, (*spvDescriptorSet0.vp_c4)._m0[45].y, _393);
    float _399 = fma(_364, -0.01750000007450580596923828125, _314);
    out.m_40.x = _383;
    out.gl_Position.x = _348;
    out.gl_Position.y = _391;
    out.gl_Position.z = _397;
    out.gl_Position.w = _186;
    out.m_42.x = _389;
    out.m_42.y = _399;
    if (!_180)
    {
        out.gl_Position.w = 0.0;
    }
    float _401 = _258 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _403 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _405 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_44.x = _401;
    out.m_44.y = _403;
    out.m_44.z = _405;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _58 = in.m_29.y;
    float _60 = in.m_29.z;
    float _62 = in.m_29.x;
    bool _66 = _58 >= 0.100000001490116119384765625;
    bool _68 = isnan(_58);
    bool _70 = _66 || _68;
    bool _72 = isnan(0.100000001490116119384765625);
    bool _74 = _70 || _72;
    float _76 = _58 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _78 = _58 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _80 = _58 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _82 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[32].x, _76);
    float _84 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[34].x, _80);
    float _86 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[32].z, _82);
    float _88 = 0.0;
    if (_74)
    {
        _88 = _60;
    }
    float _90 = _88;
    float _92 = _90;
    if (!_74)
    {
        float _94 = _60 * 1.0499999523162841796875;
        _92 = _94;
    }
    float _96 = _92;
    float _98 = 0.0;
    if (_74)
    {
        _98 = _58;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_74)
    {
        float _104 = _58 + (-0.007000000216066837310791015625);
        _102 = _104;
    }
    float _106 = _102;
    float _108 = 0.0;
    if (_74)
    {
        _108 = _62;
    }
    float _110 = _108;
    float _112 = fma(_62, (*spvDescriptorSet0.vp_c4)._m0[33].x, _78);
    float _114 = _110;
    if (!_74)
    {
        float _116 = _62 * 1.0499999523162841796875;
        _114 = _116;
    }
    float _118 = _114;
    float _120 = _96 * _96;
    float _122 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[34].z, _84);
    float _124 = fma(_60, (*spvDescriptorSet0.vp_c4)._m0[33].z, _112);
    float _126 = _106 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _128 = fma(_118, _118, _120);
    float _130 = _106 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _132 = _106 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _134 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[5].x, _126);
    float _136 = _106 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _138 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[4].x, _130);
    float _140 = sqrt(_128);
    float _142 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[5].z, _134);
    float _144 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[6].x, _132);
    float _146 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[4].z, _138);
    float _148 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[7].x, _136);
    float _150 = _142 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _152 = _124 * _124;
    float _154 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[6].z, _144);
    float _156 = _146 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _158 = _150 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _160 = fma(_86, _86, _152);
    float _162 = fma(_96, (*spvDescriptorSet0.vp_c3)._m0[7].z, _148);
    float _164 = _154 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _166 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[11].x, _158);
    float _168 = fma(_122, _122, _160);
    float _170 = _162 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    bool _172 = _140 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _174 = isnan(_140);
    bool _176 = _172 || _174;
    bool _178 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _180 = _176 || _178;
    float _182 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[11].z, _166);
    float _184 = rsqrt(_168);
    float _186 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[11].w, _182);
    float _188 = _160;
    float _190 = _140;
    if (_180)
    {
        _188 = _186;
    }
    float _192 = _188;
    float _194 = _192;
    if (!_180)
    {
        _194 = 0.0;
    }
    float _196 = _194;
    float _198 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _200 = fma(_196, (*spvDescriptorSet0.vp_c4)._m0[40].x, _198);
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = _86 * _184;
    float _206 = _124 * _184;
    float _208 = _122 * _184;
    float _210 = -_202;
    float _212 = _210 + 1.0;
    float _214 = _204 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _216 = abs(_212);
    float _218 = log2(_216);
    float _220 = -_206;
    float _222 = -_214;
    float _224 = fma(_220, (*spvDescriptorSet0.vp_c4)._m0[42].y, _222);
    float _226 = -_208;
    float _228 = fma(_226, (*spvDescriptorSet0.vp_c4)._m0[42].z, _224);
    float _230 = fma(_228, -0.5, 0.5);
    float _232 = fma(_228, 0.5, 0.5);
    float _234 = fma(_232, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _236 = sqrt(_230);
    float _238 = _218 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _240 = fma(_232, _234, -0.212114393711090087890625);
    float _242 = fma(_232, _240, 1.570728778839111328125);
    float _244 = exp2(_238);
    float _246 = _236 * 0.636619746685028076171875;
    float _248 = -_242;
    float _250 = fma(_246, _248, 1.0);
    float _252 = fma(_244, 0.5, 0.5);
    float2 _765 = float2(_250, _252);
    float3 _256 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_765, float2(0.0), isnan(_765)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_765, float2(0.0), isnan(_765)), level(0.0)).xyz;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = _118 + (-0.5);
    float _266 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    bool _268 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _270 = isnan(0.0);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _276 = _272 || _274;
    float _278 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _280 = fma(2.0, _278, 0.5);
    float _282 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _284 = fma(2.0, _282, 0.5);
    float _286 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _288 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _290 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _292 = fma(_280, (*spvDescriptorSet0.vp_c4)._m0[5].w, _286);
    float _294 = _96 + (-0.5);
    float _296 = _264 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _298 = fma(_284, (*spvDescriptorSet0.vp_c4)._m0[5].w, _288);
    float _300 = _218 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _302 = _294 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _304 = _296 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _306 = 0.0;
    if (_276)
    {
        float _308 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _306 = _308;
    }
    float _310 = _306;
    float _312 = _290 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _314 = _302 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _316 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _318 = fma(_304, 10.0, _316);
    float _320 = _266 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _322 = _150 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _324 = _318 * 0.15915493667125701904296875;
    float _326 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _328 = fma(_314, 10.0, _326);
    float _330 = exp2(_300);
    out.m_32.x = _292;
    out.m_32.y = _298;
    out.m_32.z = _312;
    out.m_32.w = _320;
    float _332 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[8].x, _322);
    float _334 = _328 * 0.15915493667125701904296875;
    out.m_34.x = 0.0;
    float _336 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[8].z, _332);
    if (_276)
    {
        float _338 = _140 * _310;
        float _340 = precise::clamp(_338, 0.0, 1.0);
        _190 = _340;
    }
    float _342 = _190;
    float _344 = _324 * 6.283185482025146484375;
    float _346 = sin(_344);
    out.m_36.x = _206;
    float _348 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[8].w, _336);
    float _350 = _342;
    if (_276)
    {
        float _352 = -_342;
        float _354 = _352 + 1.0;
        _350 = _354;
    }
    float _356 = _350;
    out.m_38.x = _196;
    float _358 = _150 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _360 = _150 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _362 = _334 * 6.283185482025146484375;
    float _364 = sin(_362);
    float _366 = -_330;
    float _368 = fma(_366, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[9].x, _358);
    float _374 = fma(_156, (*spvDescriptorSet0.vp_c3)._m0[10].x, _360);
    int _377 = as_type<int>(_356);
    if (_276)
    {
        float _379 = _356 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _377 = as_type<int>(_379);
    }
    int _381 = _377;
    float _383 = _370 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    float _385 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[9].z, _372);
    float _387 = fma(_164, (*spvDescriptorSet0.vp_c3)._m0[10].z, _374);
    float _389 = fma(_346, 0.0350000001490116119384765625, _304);
    float _391 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[9].w, _385);
    float _393 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[10].w, _387);
    if (_276)
    {
        out.m_34.x = as_type<float>(_381);
    }
    float _395 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _397 = fma(_395, (*spvDescriptorSet0.vp_c4)._m0[45].y, _393);
    float _399 = fma(_364, -0.01750000007450580596923828125, _314);
    out.m_40.x = _383;
    out.gl_Position.x = _348;
    out.gl_Position.y = _391;
    out.gl_Position.z = _397;
    out.gl_Position.w = _186;
    out.m_42.x = _389;
    out.m_42.y = _399;
    if (!_180)
    {
        out.gl_Position.w = 0.0;
    }
    float _401 = _258 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _403 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _405 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_44.x = _401;
    out.m_44.y = _403;
    out.m_44.z = _405;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

